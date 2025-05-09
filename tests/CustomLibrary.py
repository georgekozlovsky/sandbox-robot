from robot.api.deco import keyword
from urllib.parse import urlparse
import json

@keyword
def get_server_domains_from_har(har_file):
    """
    Extracts unique server domains from HAR file and returns them as a list.
    
    Args:
        har_file: Path to the HAR file
        
    Returns:
        List of unique server domains
    """
    # Read and parse HAR file
    with open(har_file, 'r') as f:
        har_data = json.load(f)
    
    # Extract domains from entries
    domains = set()
    for entry in har_data['log']['entries']:
        url = entry['request']['url']
        domain = urlparse(url).netloc
        if domain:
            domains.add(domain)
    
    # Convert set to sorted list
    domain_list = sorted(list(domains))
    
    # Log the results
    print("\nFound server domains:")
    for domain in domain_list:
        print(f"- {domain}")
        
    return domain_list