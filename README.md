# qr2otp
Small script to convert QR to pass otp compatible string

## How to use
### capture
`QR2OTP.sh --capture | wl-copy`
<br>
or
<br>
`QR2OTP.sh --capture | pass otp insert path/to/your/otp`
<br>
`--capture` is optional and default mode

### dragon
`QR2OTP.sh --dragon | wl-copy`
<br>
or
<br>
`QR2OTP.sh --dragon | pass otp insert path/to/your/otp`

## Dependencies
- `dragon` - to drag pictures on it if possible **Needed for dragon mode**
- `grim` - to capture screen **Needed for capture mode**
- `slurp` - to select area to capture. **Needed for capture mode**
- `zbarimg` - to convert QT to otpauth. **Needed for both modes**
- `pass` and `pass otp` - to store OTP in storage. Optional.
