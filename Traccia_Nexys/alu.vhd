library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;


-- Definizione entita' ALU: gli ingressi devono tenere conto del segno!
entity alu is
  Port (
    -- Inserire qui le dichiarazioni delle porte:
    -- * Un ingresso 31 bit signed "a"
    -- * Un ingresso 31 bit signed "b"
    -- * 4 ingressi binari per la selezione dell'operazione "add, subtract, multiply, divide"
    -- * Una uscita 31 bit signed "r"
  );
end alu;

-- Definizione architettura ALU
architecture Behavioral of alu is
  signal moltiplica : signed( 63 downto 0 );
begin

  -- Processo viene eseguito ad ogni variazione su operandi e operazione selezionata
  process ( a, b, add, subtract, multiply, divide, moltiplica ) begin
    r <= a;                        -- assegnazione di default

    if add = '1' then
      r <= a + b;
    elsif ...
    elsif ...
    elsif divide = '1' then
      r <= a + b;                  -- semplificazione nel caso della divisione
    end if;
  end process;

end Behavioral;
