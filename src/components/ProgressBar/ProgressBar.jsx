import Box from '@mui/material/Box';
import Stepper from '@mui/material/Stepper';
import Step from '@mui/material/Step';
import StepLabel from '@mui/material/StepLabel';

const ProgressBar = ({ step }) => {
    // steps for progress bar
    const steps = ['Start', 'Introduction', 'Team', 'Business Model', 'Product and Market', 'IP and Legal', 'Review'];

    return (
        <Box sx={{ width: '100%' }}>
            <Stepper activeStep={step - 1} alternativeLabel>
                {steps.map((label) => {
                    return (
                        <Step>
                            <StepLabel>{label}</StepLabel>
                        </Step>
                    );
                })}
            </Stepper>
        </Box>
    );
}

export default ProgressBar;