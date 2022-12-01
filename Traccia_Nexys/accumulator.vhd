library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;


entity accumulator is
  Port (
    -- Inserire qui le dichiarazioni delle porte:
    -- * Un ingresso di clock "clock"
    -- * Un ingresso di reset "reset"
    -- * Un ingresso che resetta l'uscita (bottone centrale) "acc_init".
    -- * Un ingresso che rende disponibile l'ingresso in uscita all'accumulatore "acc_enable"
    -- * Un ingresso a 32bit signed "acc_in"
    -- * Una uscita a 32bit signed "acc_out"
  );
end accumulator;

architecture Behavioral of accumulator is begin

  process ( clock, reset ) begin
    if reset = '0' then
      -- Valore di reset
    elsif rising_edge( clock ) then
      -- se acc_init e' attivo resetta l'uscita, altrimenti se acc_enable e' attivo
      -- rendi disponibile l'ingresso in uscita.
      if ...  then

      elsif ... then

      end if;
    end if;
  end process;

end Behavioral;
