{-# LANGUAGE ScopedTypeVariables #-}

-- Sunroof DSL example
import SunroofDSL


foo = do
        renderClockFaceLine <- function $ \(c :: JSCanvas, u :: JSNumber, n :: JSNumber) -> do
            c # save
            -- Draw one of the indicator lines
            c # beginPath
            c # moveTo (0, -u * 1.0)
            if  (n `mod` 5 == 0) then 
                (c # lineTo (0, -u * 0.8)) else -- Minute line
                (c # lineTo (0, -u * 0.9)) -- Hour line
            if  (n `mod` 15 == 0) then
                (c # setLineWidth 8) else -- Quarter line
                (c # setLineWidth 3) -- Non-Quarter line
            c # stroke
            c # closePath
            -- Draw of the hour numbers
            if  (n `mod` 5 == 0) then
                (do
                  c # translate (-u * 0.75, 0)
                  c # rotate (-2 * pi / 4)
                  c # fillText (cast $ n `div` 5) (0, 0)
                ) else (return ())
            c # restore
        return ()