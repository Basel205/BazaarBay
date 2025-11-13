// ---------------- Confirm Deletion ----------------
function confirmDelete(entity, name) {
    return confirm(`Are you sure you want to delete this ${entity}: "${name}"?`);
}

// Attach delete confirmation to all delete links (admin dashboard)
document.addEventListener('DOMContentLoaded', function() {
    const deleteLinks = document.querySelectorAll('a[href*="delete"]');
    deleteLinks.forEach(link => {
        link.addEventListener('click', function(event) {
            const entity = link.href.includes('product') ? 'product' : 'category';
            const name = link.closest('tr').querySelector('td:nth-child(2)').innerText;
            if (!confirmDelete(entity, name)) {
                event.preventDefault();
            }
        });
    });
});
