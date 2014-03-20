module SunroofDSL where


(#) :: a -> (a -> b) -> b
(#) = undefined

translate :: (JSNumber,JSNumber) -> JSCanvas -> JS ()
translate = undefined

rotate :: JSNumber -> JSCanvas -> JS ()
rotate = undefined

fillText :: JSString -> (JSNumber,JSNumber) -> JSCanvas -> JS ()
fillText = undefined

restore :: JSCanvas -> JS ()
restore = undefined

setLineWidth :: JSNumber -> JSCanvas -> JS ()
setLineWidth = undefined

stroke :: JSCanvas -> JS ()
stroke = undefined

closePath :: JSCanvas -> JS ()
closePath = undefined

cast :: a -> b
cast = undefined

save :: JSCanvas -> JS ()
save = undefined

beginPath :: JSCanvas -> JS ()
beginPath = undefined

moveTo :: (JSNumber, JSNumber) -> JSCanvas -> JS ()
moveTo = undefined

lineTo :: (JSNumber, JSNumber) -> JSCanvas -> JS ()
lineTo = undefined

data JSCanvas = JSCanvas
data JSNumber = JSNumber

instance Eq JSNumber where {}
instance Ord JSNumber where {}
instance Floating JSNumber where {}
instance Num JSNumber where {}
instance Fractional JSNumber where {}
instance Integral JSNumber where {}
instance Real JSNumber where {}
instance Enum JSNumber where {}

data JSString = JSString
data JSFunction a b = JSFunction

function :: (a -> JS b) -> JS (JSFunction a b)
function = undefined

data JS a = JS

instance Monad JS where {}
