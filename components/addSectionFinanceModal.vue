<template>
    <div>
      <!-- Add Button -->
      <svg style="color: black; height:36px; width:36px; margin: 12px;" viewBox="0 0 1024 1024" xmlns="http://www.w3.org/2000/svg" @click="openModal"><path fill="black" d="M512 64a448 448 0 1 1 0 896 448 448 0 0 1 0-896zm-38.4 409.6H326.4a38.4 38.4 0 1 0 0 76.8h147.2v147.2a38.4 38.4 0 0 0 76.8 0V550.4h147.2a38.4 38.4 0 0 0 0-76.8H550.4V326.4a38.4 38.4 0 1 0-76.8 0v147.2z"></path></svg>
  
      <!-- Modal -->
      <div v-if="showModal" class="z-10 ml-40 pt-72 absolute inset-0 flex items-center justify-center">
        <div class="bg-white rounded-lg shadow-md p-5 overflow-y-auto">
          <!-- Modal Content -->
          <div class="flex justify-between">
            <h2 class="text-2xl font-bold mb-4">{{ modalHeading }}</h2>
            <button class="bg-red-500 text-white text-xl font-xl px-3 py-1 mt-4 rounded-md" @click="closeModal">X</button>
          </div>
           <sectionFinance/>        
        </div>
      </div>
    </div>
  </template>
  
  <script>
  export default {
    data() {
      return {
        showModal: false,
        modalHeading: 'Add new record',
        modalParagraph: 'This is the modal paragraph content. It can be long and scrollable.',
      };
    },
    methods: {
      openModal() {
        this.showModal = true;
      },
      closeModal() {
        this.showModal = false;
      },
    },
  };
  </script>
  
  <style scoped>
  /* Add custom styling here if needed */
  </style>
  