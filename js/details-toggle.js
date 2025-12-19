/**
 * Details Toggle 功能
 * 按分组控制 details 元素的展开/收起
 */

function toggleGroupDetails(groupName, toggleId, expandText, collapseText) {
  const button = document.getElementById(toggleId);
  
  if (!button || !groupName) {
    return;
  }
  
  // 查找所有具有相同分组名的 details 元素
  const groupedDetails = document.querySelectorAll(`details[data-group="${groupName}"]`);
  
  if (groupedDetails.length === 0) {
    return;
  }
  
  // 检查当前状态：如果所有 details 都是展开的，则收起；否则展开
  const allExpanded = Array.from(groupedDetails).every(detail => detail.open);
  
  if (allExpanded) {
    // 全部收起
    groupedDetails.forEach(detail => {
      detail.open = false;
    });
    button.textContent = expandText;
    button.setAttribute('data-state', 'collapsed');
  } else {
    // 全部展开
    groupedDetails.forEach(detail => {
      detail.open = true;
    });
    button.textContent = collapseText;
    button.setAttribute('data-state', 'expanded');
  }
}

// 页面加载完成后，为所有 details-toggle 按钮设置初始状态
document.addEventListener('DOMContentLoaded', function() {
  const toggleButtons = document.querySelectorAll('.details-toggle-btn[data-group]');
  
  toggleButtons.forEach(button => {
    const groupName = button.getAttribute('data-group');
    const groupedDetails = document.querySelectorAll(`details[data-group="${groupName}"]`);
    
    if (groupedDetails.length > 0) {
      const allExpanded = Array.from(groupedDetails).every(detail => detail.open);
      
      if (allExpanded) {
        button.setAttribute('data-state', 'expanded');
      } else {
        button.setAttribute('data-state', 'collapsed');
      }
    }
  });
});

console.log('✅ Details Toggle JavaScript loaded successfully');