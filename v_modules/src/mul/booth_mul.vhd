library IEEE;
use IEEE.std_logic_1164.all; 	--  libreria IEEE con definizione tipi standard logic
use WORK.constants.all; 		-- libreria WORK user-defined
USE IEEE.NUMERIC_STD.ALL;



ENTITY BOOTHMUL IS
	GENERIC (N: INTEGER:= N_BIT);

	PORT (	A:	 IN	  std_logic_vector(N-1 DOWNTO 0);
			B:	 IN	  std_logic_vector(N-1 DOWNTO 0);
			Y:	 OUT  std_logic_vector(2*N - 1 DOWNTO 0));
END BOOTHMUL;


ARCHITECTURE STRUCTURAL_RCA OF BOOTHMUL IS

COMPONENT MUX51_GENERIC IS
	GENERIC (N: INTEGER:= N_BIT);
		   --DELAY_MUX: TIME:=Tp_mux);
	PORT (	A:	IN	STD_LOGIC_VECTOR(N-1 DOWNTO 0);
			B:	IN	STD_LOGIC_VECTOR(N-1 DOWNTO 0);
			C:	IN	STD_LOGIC_VECTOR(N-1 DOWNTO 0);
			D:	IN	STD_LOGIC_VECTOR(N-1 DOWNTO 0);
			E:	IN	STD_LOGIC_VECTOR(N-1 DOWNTO 0);
			S:	IN	ENC_OUT;
			Y:	OUT	STD_LOGIC_VECTOR(N-1 DOWNTO 0));
END COMPONENT;


COMPONENT RCA IS 
	GENERIC (--DRCAS : 	Time := 0 ns;
	         --DRCAC : 	Time := 0 ns;bb
		 	   N: 	 	INTEGER := 16);			
	PORT (		A:	IN	STD_LOGIC_VECTOR(N-1 DOWNTO 0);
				B:	IN	STD_LOGIC_VECTOR(N-1 downto 0);
				Ci: IN	std_logic;
				S:	OUT STD_LOGIC_VECTOR(N-1 downto 0);
				Co: OUT std_logic);
END COMPONENT;

COMPONENT BOOTH_ENCODER IS
	GENERIC (N: INTEGER:= N_BIT);
	PORT (B: IN STD_LOGIC_VECTOR(N DOWNTO 0);	--lenght of the input + 1
		  O: OUT MUX_SEL);						--new type defined in constants
END COMPONENT;

	
	SUBTYPE SP IS STD_LOGIC_VECTOR (2*N -1 DOWNTO 0);
	TYPE AR IS ARRAY (1 DOWNTO 0) OF SP;
	TYPE FI IS ARRAY (N/2 - 1 DOWNTO 0) OF AR;
	TYPE VEC IS ARRAY (4 DOWNTO 0) OF SP;
	TYPE MS IS ARRAY (N/2 - 1 DOWNTO 0) OF VEC;
	
	SIGNAL mat: FI;				--FI is a matrix type that contains the output of 
								--both muxes and adders at every level on the structure

	SIGNAL arrenc: MUX_SEL;		--MUX_SEL is an array type declared in constants	
								--where each element is a 3 bit std logic vector
								--storing the output for each booth encoder element

	SIGNAL muxin: MS;			--MS is a matrix type containing the inputs of
								--the muxes, each one is on 2*N bit, real input
								--will be resized

	CONSTANT UNI: STD_LOGIC_VECTOR(N-1 DOWNTO 0) := (OTHERS => '1');	--std_logic_vector containing all "ones"
	SIGNAL BOOTHIN: STD_LOGIC_VECTOR(N DOWNTO 0);

BEGIN

process (A)
begin
	FOR I IN 0 TO (N/2 - 1) LOOP			--process for updating muxes input sensible on a changing in A
											--resizing all input to have uniform lenght
											--#0 =>   0
											--#1 =>   A
											--#2 =>  -A
											--#3 =>  2A
											--#4 => -2A
	MUXIN (I)(0) <=  (OTHERS => '0');														
	MUXIN (I)(1) <=  STD_LOGIC_VECTOR(RESIZE(SIGNED(A),2*N_BIT ) sll 2*i);
	MUXIN (I)(2) <=  STD_LOGIC_VECTOR(RESIZE(SIGNED(STD_LOGIC_VECTOR(UNSIGNED((A XOR (UNI))) + 1)), 2*N_BIT ) sll i*2);
	MUXIN (I)(3) <=  STD_LOGIC_VECTOR(RESIZE(SIGNED(A),2*N_BIT) sll (i*2 +1));
	MUXIN (I)(4) <=  STD_LOGIC_VECTOR(RESIZE(SIGNED(STD_LOGIC_VECTOR(UNSIGNED((A XOR (UNI))) + 1)),2*N_BIT) sll (i*2 + 1));
	END LOOP;
END PROCESS;
	
	BOOTHIN <= B & '0';		--B is extended with a 0 on the right

	Boothenc:  BOOTH_ENCODER GENERIC MAP (N=> N_BIT)
							PORT MAP (B=> BOOTHIN, O => ARRENC );

	Fstmux:  MUX51_GENERIC GENERIC MAP (N => (2 * N_BIT))
					PORT MAP (	A => MUXIN (0)(0),													
								B => MUXIN (0)(1),						
								C => MUXIN (0)(2), 
								D => MUXIN (0)(3),			
								E => MUXIN (0)(4),			
								S => arrenc (0),
								Y => mat(0)(1));

	Big4:	FOR I IN 1 TO N_BIT/2 - 1 GENERATE

				nMux: MUX51_GENERIC GENERIC MAP (N => (2 * N_BIT))
									PORT MAP ( A => MUXIN (I)(0),
							   				   B => MUXIN (I)(1),
							  				   C => MUXIN (I)(2),
							   				   D => MUXIN (I)(3),
							   				   E => MUXIN (I)(4),
							   				   S => arrenc(I),
							   				   Y => mat(I)(0));

			    Sums: RCA GENERIC MAP (N => (2* N_BIT ))
					      PORT MAP(A => mat(I)(0),         
								   B => mat(I-1)(1),
								   Ci =>'0',
								   S => mat(I)(1)
								  );
			END GENERATE;

	Y <= mat(N_BIT/2 -1)(1);
	
END STRUCTURAL_RCA;

-----------------------------------------------------------
--*******************************************************--
--Same architecture as before, but with a different adder--
--*******************************************************--
-----------------------------------------------------------

ARCHITECTURE STRUCTURAL_P4 OF BOOTHMUL IS

COMPONENT MUX51_GENERIC IS
	GENERIC (N: INTEGER:= N_BIT);
		   --DELAY_MUX: TIME:=Tp_mux);
	Port (	A:	IN	STD_LOGIC_VECTOR(N-1 DOWNTO 0);
			B:	IN	STD_LOGIC_VECTOR(N-1 DOWNTO 0);
			C:	IN	STD_LOGIC_VECTOR(N-1 DOWNTO 0);
			D:	IN	STD_LOGIC_VECTOR(N-1 DOWNTO 0);
			E:	IN	STD_LOGIC_VECTOR(N-1 DOWNTO 0);
			S:	IN	ENC_OUT;
			Y:	OUT	STD_LOGIC_VECTOR(N-1 DOWNTO 0));
END COMPONENT;

COMPONENT P4_ADDER IS
	GENERIC (	N_BIT_SUM: INTEGER:= 32;
		 		M: INTEGER:= 4);
	PORT (  A: 	IN STD_LOGIC_VECTOR (N_BIT_SUM-1 DOWNTO 0);
			B: 	IN STD_LOGIC_VECTOR (N_BIT_SUM-1 DOWNTO 0);
			CI: IN STD_LOGIC;
			CO: OUT STD_LOGIC;
			S: 	OUT STD_LOGIC_VECTOR (N_BIT_SUM-1 DOWNTO 0));		
END COMPONENT;

COMPONENT BOOTH_ENCODER IS
	GENERIC (N: INTEGER:= N_BIT);
	PORT (B: IN STD_LOGIC_VECTOR(N DOWNTO 0);
		  O: OUT MUX_SEL);
END COMPONENT;
	
	SUBTYPE SP IS STD_LOGIC_VECTOR (2*N -1 DOWNTO 0);
	TYPE AR IS ARRAY (1 DOWNTO 0) OF SP;
	TYPE FI IS ARRAY (N/2 - 1 DOWNTO 0) OF AR;

	TYPE VEC IS ARRAY (4 DOWNTO 0) OF SP;
	TYPE MS IS ARRAY (N/2 - 1 DOWNTO 0) OF VEC;
	
	SIGNAL mat: FI;
	SIGNAL arrenc: MUX_SEL;
	SIGNAL muxin: MS;
	CONSTANT UNI: STD_LOGIC_VECTOR(N-1 DOWNTO 0) := (OTHERS => '1');
	SIGNAL BOOTHIN: STD_LOGIC_VECTOR(N DOWNTO 0);

BEGIN

process (A)
begin
	FOR I IN 0 TO (N/2 - 1) LOOP
			MUXIN (I)(0) <=  (OTHERS => '0');																	
			MUXIN (I)(1) <=  STD_LOGIC_VECTOR(RESIZE(SIGNED(A),2*N_BIT ) sll 2*i);
			MUXIN (I)(2) <=  STD_LOGIC_VECTOR(RESIZE(SIGNED(STD_LOGIC_VECTOR(UNSIGNED((A XOR (UNI))) + 1)), 2*N_BIT ) sll i*2);
			MUXIN (I)(3) <=  STD_LOGIC_VECTOR(RESIZE(SIGNED(A),2*N_BIT) sll (i*2 +1));
			MUXIN (I)(4) <=  STD_LOGIC_VECTOR(RESIZE(SIGNED(STD_LOGIC_VECTOR(UNSIGNED((A XOR (UNI))) + 1)),2*N_BIT) sll (i*2 + 1));
	END LOOP;
END PROCESS;
	
	BOOTHIN <= B & '0';
	Boothenc:  BOOTH_ENCODER GENERIC MAP (N=> N_BIT)
							PORT MAP (B=> BOOTHIN, O => ARRENC );

	Fstmux:  MUX51_GENERIC generic map (N => (2 * N_BIT))
					port map (	A => MUXIN (0)(0),													
								B => MUXIN (0)(1),						
								C => MUXIN (0)(2), 
								D => MUXIN (0)(3),			
								E => MUXIN (0)(4),			
								S => arrenc (0),
								Y => mat(0)(1));

	Big4:	FOR I IN 1 TO N_BIT/2 - 1 GENERATE

				nMux: MUX51_GENERIC GENERIC MAP (N => (2 * N_BIT))
									PORT MAP ( A => MUXIN (I)(0),
							   				   B => MUXIN (I)(1),
							  				   C => MUXIN (I)(2),
							   				   D => MUXIN (I)(3),
							   				   E => MUXIN (I)(4),
							   				   S => arrenc(I),
							   				   Y => mat(I)(0));

			    Sums: P4_ADDER GENERIC MAP (N_BIT_SUM => 2*N_BIT ,
		 									M => M)
					      PORT MAP(A => mat(I)(0),
								   B => mat(I-1)(1),
								   Ci =>'0',
								   S => mat(I)(1)
								  );
			END GENERATE;

	Y <= mat(N_BIT/2 -1)(1);
	
END STRUCTURAL_P4;

CONFIGURATION CFG_MUL_P4 OF BOOTHMUL IS
	FOR STRUCTURAL_P4
	END FOR;
END CFG_MUL_P4;

CONFIGURATION CFG_MUL_RCA OF BOOTHMUL IS
	FOR STRUCTURAL_RCA
	END FOR;
END CFG_MUL_RCA;



