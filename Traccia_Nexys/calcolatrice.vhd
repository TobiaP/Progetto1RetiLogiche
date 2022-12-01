library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;



entity calcolatrice is
  Port (
    -- Inserire qui le dichiarazioni delle porte:
    -- * Un ingresso clock
    -- * Un ingresso reset
    -- * Un ingresso per gli switch "SW"
    -- * Una uscita per i led "LED"
    -- * Ingressi per i bottoni "BTNC, BTNU, BTNL, BTNR, BTND"
	
    CA, CB, CC, CD, CE, CF, CG, DP : out std_logic;
    AN : out std_logic_vector( 7 downto 0 );

  );
end calcolatrice;

architecture Behavioral of calcolatrice is

  -- Segnali interni per i debouncer
  signal center_edge, up_edge, left_edge, right_edge, down_edge : std_logic;
  -- Segnali di ingresso/uscita per accumulatore
  signal acc_in, acc_out : signed( 31 downto 0 );
  -- Segnali di init e load per accumulatore
  signal acc_init, acc_enable : std_logic;
  -- Segnali di controllo per ALU
  signal do_add, do_sub, do_mult, do_div : std_logic;
  -- L'uscita dell'accumulatore va convertiva in std_logic_vector
  signal display_value : std_logic_vector( 31 downto 0 );
  -- Segnali per gli switch di ingresso
  signal sw_input : std_logic_vector( 31 downto 0 );
 
begin
  
  -- Dichiarazione Bottoni:
  center_detect : entity work.debouncer(Behavioral)
  port map (
    clock   => clock,
    reset   => reset,
    bouncy  => BTNC,
    pulse   => center_edge
  );
  
  up_detect : entity work.debouncer(Behavioral)
  port map (
    -- collega il bottone
  );
  
  down_detect : entity work.debouncer(Behavioral)
  port map (
    -- collega il bottone
  );
  
  left_detect : entity work.debouncer(Behavioral)
  port map (
    -- collega il bottone
  );

  right_detect : entity work.debouncer(Behavioral)
  port map (
    -- collega il bottone
  );
  
  -- Instantiate the seven segment display driver
  thedriver : entity work.seven_segment_driver( Behavioral ) 
  generic map ( 
     size => 21 
  ) port map (
    clock => clock,
    reset => reset,
    digit0 => display_value( 3 downto 0 ),
    digit1 => display_value( 7 downto 4 ),
    digit2 => display_value( 11 downto 8 ),
    digit3 => display_value( 15 downto 12 ),
    digit4 => display_value( 19 downto 16 ),
    digit5 => display_value( 23 downto 20 ),
    digit6 => display_value( 27 downto 24 ),
    digit7 => display_value( 31 downto 28 ),
    CA     => CA,
    CB     => CB,
    CC     => CC,
    CD     => CD,
    CE     => CE,
    CF     => CF,
    CG     => CG,
    DP     => DP,
    AN     => AN
  );
  LED <= SW;
  
  -- Estensione a 32-bit dell'ingresso
  sw_input <= SW(15) & SW(15) & SW(15) & SW(15) & SW(15) & SW(15) & SW(15) & SW(15) &
              SW(15) & SW(15) & SW(15) & SW(15) & SW(15) & SW(15) & SW(15) & SW(15) & SW;
              
  -- Instantiate the ALU
  the_alu : entity work.alu( Behavioral ) port map (
  -- Collega la alu all'accumulatore e agli switch. Collega inoltre i segnali interni per stabilire l'operazione

  );
  -- Assegna ai segnali interni l'uscita dei corrispettivi debouncer
  do_add  <= up_edge;
  do_sub  <= ...
  do_mult <= ...
  do_div  <= ..
   
  -- Dichiarazione accumulatore
  the_accumulator : entity work.accumulator( Behavioral )
  port map(
    -- Collega l'accumulatore
  );
  -- Assegna a display value il valore d'uscita
  display_value <= std_logic_vector( ... );
   -- Assegna acc_enable e acc_init come da consegna
  acc_enable <= ...
  acc_init <= ...;

end Behavioral;
