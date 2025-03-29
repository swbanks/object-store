const axios = require('axios');

export function createChore(choreName) {
  return axios.post(`/api/chores`, {name: choreName});
}

export async function getChores() {
  try{
    const response = await axios.get(`/api/chores`);
    return response.data;
  } catch(error) {
      console.log(`Error in function getChores, ${error}`);
      return [];
  }
}

export async function deleteChore(choreId) {
  try{
    const response = await axios.delete(`/api/chores/${choreId}`);
    return response.data;
  } catch(error) {
      console.log(`Error in function deleteChore, ${error}`);
      return [];
  }
}

export async function updateFamilyVerse(verse) {
  try{
    const response = await axios.post(`/api/chores/update_family_verse`, {verse: verse});
    return response.data;
  } catch(error) {
      console.log(`Error in function updateVerse, ${error}`);
      return [];
  }
}