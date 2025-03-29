import React from 'react';
import {BrowserRouter as Router, Routes, Route} from 'react-router-dom';
import Login from './Login';
import ParentLogin from './ParentLogin';
import DailyChoreList from './DailyChoreList';
import ParentChoreChecker from './ParentChoreChecker';
import './App.css';

const App = () => {
  return (
    <Router>
      <Routes>
        <Route path="/" element={<Login />} />
      </Routes>
    </Router>
  );
};

export default App;