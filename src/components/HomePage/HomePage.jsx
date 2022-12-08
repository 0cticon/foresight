import './HomePage.css';
import React, { useState } from 'react';
import axios from 'axios';
import Button from '@mui/material/Button';
import TextField from '@mui/material/TextField';
import Dialog from '@mui/material/Dialog';
import DialogActions from '@mui/material/DialogActions';
import DialogContent from '@mui/material/DialogContent';
import DialogContentText from '@mui/material/DialogContentText';
import DialogTitle from '@mui/material/DialogTitle';
import DownloadIcon from '@mui/icons-material/Download';

function HomePage() {
  const [open, setOpen] = useState(false);
  // holds email address that will get a link for RegisterForm
  const [email, setEmail] = useState('');

  const handleClickOpen = () => {
    setOpen(true);
  };

  const handleClose = () => {
    setOpen(false);
  };

  const handleInvite = () => {
    handleEmail();
    setOpen(false);
    console.log('Send Email to supplied email address. Logout and navigate to localhost:3000/#/register/founder to register a founder');
  };

  // function that POST email
  const handleEmail = () => {
    axios.post('/api/email', 
    {
      email: email
    })
    .then(() => {
     alert('Have founder check their email')
    }).catch((err) => {
      console.log('err in handleEmail', err)
    })
  }


  return (
    <div className="container">
      <center>
        <h1>#Home</h1>
        <h4>You have new applicants for funding </h4>
        <p>View reports or add a founder to your dashboard.</p>
        <Button style={{ backgroundColor: '#1cefb9', color: '#0c3d50'}} onClick={handleClickOpen}>Invite a Founder</Button>
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
              onChange={(event) => setEmail(event.target.value)}
            />
          </DialogContent>
          <DialogActions>
            <Button onClick={handleClose} color="error">Cancel</Button>
            <Button onClick={handleInvite} style={{ color: '#0c3d50'}}>Invite</Button>
          </DialogActions>
        </Dialog>
        <br />
        <table className="home-table">
          <tbody>
          <tr>
            <th>Name</th>
            <th>Company</th>
            <th>Submit Date</th>
            <th>Risk</th>
            <th>Founder Report</th>
            <th>Add to Dashboard</th>
          </tr>
          <tr>
            <td>Charlotte</td>
            <td>Foresight</td>
            <td>08/26/2022 11:00</td>
            <td>Low</td>
            <td><Button style={{ color: '#0c3d50'}}>View</Button><Button style={{ color: '#0c3d50'}}><DownloadIcon /></Button></td>
            <td><Button style={{ color: '#0c3d50'}}>ADD</Button></td>
          </tr>
          <tr>
            <td>Meaghan</td>
            <td>Prime</td>
            <td>11/23/2022 11:19</td>
            <td>Medium</td>
            <td><Button style={{ color: '#0c3d50'}}>View</Button><Button style={{ color: '#0c3d50'}}><DownloadIcon /></Button></td>
            <td><Button style={{ color: '#0c3d50'}}>ADD</Button></td>
          </tr>
          </tbody>
        </table>
      </center>
    </div>
  );
}

export default HomePage;