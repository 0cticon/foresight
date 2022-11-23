import './HomePage.css';
import React, { useState } from 'react';
import Button from '@mui/material/Button';
import TextField from '@mui/material/TextField';
import Dialog from '@mui/material/Dialog';
import DialogActions from '@mui/material/DialogActions';
import DialogContent from '@mui/material/DialogContent';
import DialogContentText from '@mui/material/DialogContentText';
import DialogTitle from '@mui/material/DialogTitle';

function HomePage() {
  const [open, setOpen] = useState(false);

  const handleClickOpen = () => {
    setOpen(true);
  };

  const handleClose = () => {
    setOpen(false);
  }


  return (
    <div className="container">
      <center>
        <h1>Welcome!</h1>
        <Button variant="outlined" onClick={handleClickOpen}>Invite a Founder</Button>
        <Dialog open={open} onClose={handleClose}>
          <DialogTitle>Invite a Founder</DialogTitle>
          <DialogContent>
            <DialogContentText>
              Enter the Founder's email to send them the questionnaire.
            </DialogContentText>
            <TextField
              autoFocus
              margin="dense"
              id="name"
              label="Email Address"
              type="email"
              fullWidth
              variant="standard"
            />
          </DialogContent>
          <DialogActions>
            <Button onClick={handleClose} color="error">Cancel</Button>
            <Button onClick={handleClose} color="success">Invite</Button>
          </DialogActions>
        </Dialog>
        <br />
        <table class="home-table">
          <tr>
            <th>Name</th>
            <th>Company</th>
            <th>Submit Date</th>
            <th>Valuation</th>
            <th>Founder Report</th>
          </tr>
          <tr>
            <td>Charlotte</td>
            <td>Foresight</td>
            <td>08/26/2022 11:00</td>
            <td>$10M</td>
            <td><Button>View</Button><Button>Download</Button></td>
          </tr>
          <tr>
            <td>Meaghan</td>
            <td>Prime</td>
            <td>11/23/22 11:19</td>
            <td>$15M</td>
            <td><Button>View</Button><Button>Download</Button></td>
          </tr>
        </table>
      </center>
    </div>
  );
}

export default HomePage;