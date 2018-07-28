library IEEE;
use IEEE.std_logic_1164.all; --  libreria IEEE con definizione tipi standard logic
use WORK.constants.all; -- libreria WORK user-defined

entity MUX51_GENERIC is
	GENERIC (N: INTEGER:= N_BIT);
		   --DELAY_MUX: TIME:=Tp_mux);

	Port (	A:	IN	STD_LOGIC_VECTOR(N-1 DOWNTO 0);
			B:	IN	STD_LOGIC_VECTOR(N-1 DOWNTO 0);
			C:	IN	STD_LOGIC_VECTOR(N-1 DOWNTO 0);
			D:	IN	STD_LOGIC_VECTOR(N-1 DOWNTO 0);
			E:	IN	STD_LOGIC_VECTOR(N-1 DOWNTO 0);
			S:	IN	ENC_OUT;
			Y:	OUT	STD_LOGIC_VECTOR(N-1 DOWNTO 0));

	END MUX51_GENERIC;



architecture STRUCTURAL OF MUX51_GENERIC IS

	COMPONENT MUX21_GENERIC IS
		GENERIC (N: INTEGER:= N_BIT);
			   --DELAY_MUX: TIME:=Tp_mux);

		PORT (	A:	In	std_logic_vector(N-1 DOWNTO 0);
				B:	In	std_logic_vector(N-1 DOWNTO 0);
				Sel:	In	std_logic;
				Y:	OUT	std_logic_vector(N-1 DOWNTO 0));
	END COMPONENT;
	
	SIGNAL s1,s2,s3: STD_LOGIC_VECTOR(N-1 DOWNTO 0);

	BEGIN
		mxAB: MUX21_GENERIC GENERIC MAP (N) PORT MAP (B,A,S(0),s1);
		mxCD: MUX21_GENERIC GENERIC MAP (N) PORT MAP (D,C,S(0),s2);
		mxss: MUX21_GENERIC GENERIC MAP (N) PORT MAP (s2,s1,S(1),s3);
		mxsE: MUX21_GENERIC GENERIC MAP (N) PORT MAP (E,s3,S(2),Y);
	END STRUCTURAL;
