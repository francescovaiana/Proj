##	+----------------------------------------------------------------
##	|	Synthesis and Optimization of Digital Systems		|
##	|		Politecnico di Torino - TO - Italy		|
##	|			DAUIN - EDA GROUP			|
##	+---------------------------------------------------------------
##	|	author: andrea calimera					|
##	|	mail:	andrea.calimera@polito.it			|
##	|	title:	synthesis.tcl					|
##	+----------------------------------------------------------------
##	| 	Copyright 2015 DAUIN - EDA GROUP			|
##	+----------------------------------------------------------------

######################################################################
##
## SPECIFY LIBRARIES
##
######################################################################

# SOURCE SETUP FILE
source "./tech/STcmos65/synopsys_dc.setup"

# SUPPRESS WARNING MESSAGES
suppress_message MWLIBP-319
suppress_message MWLIBP-324
suppress_message TFCHK-012
suppress_message TFCHK-014
suppress_message TFCHK-049
suppress_message TFCHK-072
suppress_message TFCHK-084
suppress_message PSYN-651
suppress_message PSYN-650
suppress_message UID-401
suppress_message LINK-14
suppress_message TIM-134
suppress_message VER-130
suppress_message UISN-40
suppress_message VO-4
suppress_message RTDC-126

######################################################################
##
## READ DESIGN
##
######################################################################
