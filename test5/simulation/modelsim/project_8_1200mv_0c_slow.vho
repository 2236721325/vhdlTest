-- Copyright (C) 1991-2013 Altera Corporation
-- Your use of Altera Corporation's design tools, logic functions 
-- and other software and tools, and its AMPP partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Altera Program License 
-- Subscription Agreement, Altera MegaCore Function License 
-- Agreement, or other applicable license agreement, including, 
-- without limitation, that your use is for the sole purpose of 
-- programming logic devices manufactured by Altera and sold by 
-- Altera or its authorized distributors.  Please refer to the 
-- applicable agreement for further details.

-- VENDOR "Altera"
-- PROGRAM "Quartus II 64-Bit"
-- VERSION "Version 13.0.0 Build 156 04/24/2013 SJ Full Version"

-- DATE "09/16/2023 23:22:52"

-- 
-- Device: Altera EP4CE10F17C8 Package FBGA256
-- 

-- 
-- This VHDL file should be used for ModelSim-Altera (VHDL) only
-- 

LIBRARY ALTERA;
LIBRARY CYCLONEIVE;
LIBRARY IEEE;
USE ALTERA.ALTERA_PRIMITIVES_COMPONENTS.ALL;
USE CYCLONEIVE.CYCLONEIVE_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	digitalTube IS
    PORT (
	clock : IN std_logic;
	key : IN std_logic_vector(3 DOWNTO 0);
	segment : OUT std_logic_vector(7 DOWNTO 0);
	selector : OUT std_logic_vector(2 DOWNTO 0)
	);
END digitalTube;

-- Design Ports Information
-- segment[0]	=>  Location: PIN_L2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- segment[1]	=>  Location: PIN_N1,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- segment[2]	=>  Location: PIN_K5,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- segment[3]	=>  Location: PIN_L1,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- segment[4]	=>  Location: PIN_K2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- segment[5]	=>  Location: PIN_N2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- segment[6]	=>  Location: PIN_L6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- segment[7]	=>  Location: PIN_C16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- selector[0]	=>  Location: PIN_R8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- selector[1]	=>  Location: PIN_P8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- selector[2]	=>  Location: PIN_N8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- key[0]	=>  Location: PIN_E16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- key[1]	=>  Location: PIN_E15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- key[2]	=>  Location: PIN_L3,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- key[3]	=>  Location: PIN_K1,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- clock	=>  Location: PIN_E1,	 I/O Standard: 2.5 V,	 Current Strength: Default


ARCHITECTURE structure OF digitalTube IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_clock : std_logic;
SIGNAL ww_key : std_logic_vector(3 DOWNTO 0);
SIGNAL ww_segment : std_logic_vector(7 DOWNTO 0);
SIGNAL ww_selector : std_logic_vector(2 DOWNTO 0);
SIGNAL \clock~inputclkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \segment[0]~output_o\ : std_logic;
SIGNAL \segment[1]~output_o\ : std_logic;
SIGNAL \segment[2]~output_o\ : std_logic;
SIGNAL \segment[3]~output_o\ : std_logic;
SIGNAL \segment[4]~output_o\ : std_logic;
SIGNAL \segment[5]~output_o\ : std_logic;
SIGNAL \segment[6]~output_o\ : std_logic;
SIGNAL \segment[7]~output_o\ : std_logic;
SIGNAL \selector[0]~output_o\ : std_logic;
SIGNAL \selector[1]~output_o\ : std_logic;
SIGNAL \selector[2]~output_o\ : std_logic;
SIGNAL \key[3]~input_o\ : std_logic;
SIGNAL \key[1]~input_o\ : std_logic;
SIGNAL \key[2]~input_o\ : std_logic;
SIGNAL \key[0]~input_o\ : std_logic;
SIGNAL \Mux6~0_combout\ : std_logic;
SIGNAL \Mux5~0_combout\ : std_logic;
SIGNAL \Mux4~0_combout\ : std_logic;
SIGNAL \Mux3~0_combout\ : std_logic;
SIGNAL \Mux2~0_combout\ : std_logic;
SIGNAL \Mux1~0_combout\ : std_logic;
SIGNAL \Mux0~0_combout\ : std_logic;
SIGNAL \clock~input_o\ : std_logic;
SIGNAL \clock~inputclkctrl_outclk\ : std_logic;
SIGNAL \current_selector[0]~2_combout\ : std_logic;
SIGNAL \current_selector[1]~0_combout\ : std_logic;
SIGNAL \current_selector[2]~1_combout\ : std_logic;
SIGNAL current_selector : std_logic_vector(2 DOWNTO 0);
SIGNAL \ALT_INV_Mux1~0_combout\ : std_logic;
SIGNAL \ALT_INV_Mux2~0_combout\ : std_logic;
SIGNAL \ALT_INV_Mux3~0_combout\ : std_logic;
SIGNAL \ALT_INV_Mux4~0_combout\ : std_logic;
SIGNAL \ALT_INV_Mux5~0_combout\ : std_logic;
SIGNAL \ALT_INV_Mux6~0_combout\ : std_logic;

BEGIN

ww_clock <= clock;
ww_key <= key;
segment <= ww_segment;
selector <= ww_selector;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;

\clock~inputclkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \clock~input_o\);
\ALT_INV_Mux1~0_combout\ <= NOT \Mux1~0_combout\;
\ALT_INV_Mux2~0_combout\ <= NOT \Mux2~0_combout\;
\ALT_INV_Mux3~0_combout\ <= NOT \Mux3~0_combout\;
\ALT_INV_Mux4~0_combout\ <= NOT \Mux4~0_combout\;
\ALT_INV_Mux5~0_combout\ <= NOT \Mux5~0_combout\;
\ALT_INV_Mux6~0_combout\ <= NOT \Mux6~0_combout\;

-- Location: IOOBUF_X0_Y8_N16
\segment[0]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \ALT_INV_Mux6~0_combout\,
	devoe => ww_devoe,
	o => \segment[0]~output_o\);

-- Location: IOOBUF_X0_Y7_N23
\segment[1]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \ALT_INV_Mux5~0_combout\,
	devoe => ww_devoe,
	o => \segment[1]~output_o\);

-- Location: IOOBUF_X0_Y6_N16
\segment[2]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \ALT_INV_Mux4~0_combout\,
	devoe => ww_devoe,
	o => \segment[2]~output_o\);

-- Location: IOOBUF_X0_Y8_N23
\segment[3]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \ALT_INV_Mux3~0_combout\,
	devoe => ww_devoe,
	o => \segment[3]~output_o\);

-- Location: IOOBUF_X0_Y8_N2
\segment[4]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \ALT_INV_Mux2~0_combout\,
	devoe => ww_devoe,
	o => \segment[4]~output_o\);

-- Location: IOOBUF_X0_Y7_N16
\segment[5]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \ALT_INV_Mux1~0_combout\,
	devoe => ww_devoe,
	o => \segment[5]~output_o\);

-- Location: IOOBUF_X0_Y9_N9
\segment[6]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Mux0~0_combout\,
	devoe => ww_devoe,
	o => \segment[6]~output_o\);

-- Location: IOOBUF_X34_Y20_N9
\segment[7]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \segment[7]~output_o\);

-- Location: IOOBUF_X16_Y0_N9
\selector[0]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => current_selector(0),
	devoe => ww_devoe,
	o => \selector[0]~output_o\);

-- Location: IOOBUF_X16_Y0_N16
\selector[1]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => current_selector(1),
	devoe => ww_devoe,
	o => \selector[1]~output_o\);

-- Location: IOOBUF_X16_Y0_N23
\selector[2]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => current_selector(2),
	devoe => ww_devoe,
	o => \selector[2]~output_o\);

-- Location: IOIBUF_X0_Y8_N8
\key[3]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_key(3),
	o => \key[3]~input_o\);

-- Location: IOIBUF_X34_Y12_N1
\key[1]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_key(1),
	o => \key[1]~input_o\);

-- Location: IOIBUF_X0_Y7_N1
\key[2]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_key(2),
	o => \key[2]~input_o\);

-- Location: IOIBUF_X34_Y12_N8
\key[0]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_key(0),
	o => \key[0]~input_o\);

-- Location: LCCOMB_X1_Y8_N12
\Mux6~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux6~0_combout\ = (!\key[3]~input_o\ & (!\key[1]~input_o\ & (\key[2]~input_o\ $ (\key[0]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000100010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \key[3]~input_o\,
	datab => \key[1]~input_o\,
	datac => \key[2]~input_o\,
	datad => \key[0]~input_o\,
	combout => \Mux6~0_combout\);

-- Location: LCCOMB_X1_Y8_N30
\Mux5~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux5~0_combout\ = (!\key[3]~input_o\ & (\key[2]~input_o\ & (\key[1]~input_o\ $ (\key[0]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001000001000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \key[3]~input_o\,
	datab => \key[1]~input_o\,
	datac => \key[2]~input_o\,
	datad => \key[0]~input_o\,
	combout => \Mux5~0_combout\);

-- Location: LCCOMB_X1_Y8_N28
\Mux4~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux4~0_combout\ = (!\key[3]~input_o\ & (\key[1]~input_o\ & (!\key[2]~input_o\ & !\key[0]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \key[3]~input_o\,
	datab => \key[1]~input_o\,
	datac => \key[2]~input_o\,
	datad => \key[0]~input_o\,
	combout => \Mux4~0_combout\);

-- Location: LCCOMB_X1_Y8_N14
\Mux3~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux3~0_combout\ = (\key[1]~input_o\ & ((\key[3]~input_o\) # ((\key[2]~input_o\ & \key[0]~input_o\)))) # (!\key[1]~input_o\ & (\key[2]~input_o\ $ (((!\key[3]~input_o\ & \key[0]~input_o\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110100110111000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \key[3]~input_o\,
	datab => \key[1]~input_o\,
	datac => \key[2]~input_o\,
	datad => \key[0]~input_o\,
	combout => \Mux3~0_combout\);

-- Location: LCCOMB_X1_Y8_N16
\Mux2~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux2~0_combout\ = (\key[1]~input_o\ & (!\key[3]~input_o\ & ((\key[0]~input_o\)))) # (!\key[1]~input_o\ & ((\key[2]~input_o\ & (!\key[3]~input_o\)) # (!\key[2]~input_o\ & ((\key[0]~input_o\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101011100010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \key[3]~input_o\,
	datab => \key[1]~input_o\,
	datac => \key[2]~input_o\,
	datad => \key[0]~input_o\,
	combout => \Mux2~0_combout\);

-- Location: LCCOMB_X1_Y8_N10
\Mux1~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux1~0_combout\ = (!\key[3]~input_o\ & ((\key[1]~input_o\ & ((\key[0]~input_o\) # (!\key[2]~input_o\))) # (!\key[1]~input_o\ & (!\key[2]~input_o\ & \key[0]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100010100000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \key[3]~input_o\,
	datab => \key[1]~input_o\,
	datac => \key[2]~input_o\,
	datad => \key[0]~input_o\,
	combout => \Mux1~0_combout\);

-- Location: LCCOMB_X1_Y8_N0
\Mux0~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux0~0_combout\ = (\key[3]~input_o\) # ((\key[1]~input_o\ & ((!\key[0]~input_o\) # (!\key[2]~input_o\))) # (!\key[1]~input_o\ & (\key[2]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011111011111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \key[3]~input_o\,
	datab => \key[1]~input_o\,
	datac => \key[2]~input_o\,
	datad => \key[0]~input_o\,
	combout => \Mux0~0_combout\);

-- Location: IOIBUF_X0_Y11_N8
\clock~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_clock,
	o => \clock~input_o\);

-- Location: CLKCTRL_G2
\clock~inputclkctrl\ : cycloneive_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \clock~inputclkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \clock~inputclkctrl_outclk\);

-- Location: LCCOMB_X16_Y1_N20
\current_selector[0]~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \current_selector[0]~2_combout\ = !current_selector(0)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => current_selector(0),
	combout => \current_selector[0]~2_combout\);

-- Location: FF_X16_Y1_N21
\current_selector[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \current_selector[0]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => current_selector(0));

-- Location: LCCOMB_X16_Y1_N18
\current_selector[1]~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \current_selector[1]~0_combout\ = current_selector(1) $ (current_selector(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => current_selector(1),
	datad => current_selector(0),
	combout => \current_selector[1]~0_combout\);

-- Location: FF_X16_Y1_N19
\current_selector[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \current_selector[1]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => current_selector(1));

-- Location: LCCOMB_X16_Y1_N28
\current_selector[2]~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \current_selector[2]~1_combout\ = current_selector(2) $ (((current_selector(1) & current_selector(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => current_selector(1),
	datac => current_selector(2),
	datad => current_selector(0),
	combout => \current_selector[2]~1_combout\);

-- Location: FF_X16_Y1_N29
\current_selector[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \current_selector[2]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => current_selector(2));

ww_segment(0) <= \segment[0]~output_o\;

ww_segment(1) <= \segment[1]~output_o\;

ww_segment(2) <= \segment[2]~output_o\;

ww_segment(3) <= \segment[3]~output_o\;

ww_segment(4) <= \segment[4]~output_o\;

ww_segment(5) <= \segment[5]~output_o\;

ww_segment(6) <= \segment[6]~output_o\;

ww_segment(7) <= \segment[7]~output_o\;

ww_selector(0) <= \selector[0]~output_o\;

ww_selector(1) <= \selector[1]~output_o\;

ww_selector(2) <= \selector[2]~output_o\;
END structure;


