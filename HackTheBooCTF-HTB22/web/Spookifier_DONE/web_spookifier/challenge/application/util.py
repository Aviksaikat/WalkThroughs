from mako.template import Template

font1 = {
	'A': '𝕬',
	'B': '𝕭',
	'C': '𝕮',
	'D': '𝕯',
	'E': '𝕰',
	'F': '𝕱',
	'G': '𝕲',
	'H': '𝕳',
	'I': '𝕴',
	'J': '𝕵',
	'K': '𝕶',
	'L': '𝕷',
	'M': '𝕸',
	'N': '𝕹',
	'O': '𝕺',
	'P': '𝕻',
	'Q': '𝕼',
	'R': '𝕽',
	'S': '𝕾',
	'T': '𝕿',
	'U': '𝖀',
	'V': '𝖁',
	'W': '𝖂',
	'X': '𝖃',
	'Y': '𝖄',
	'Z': '𝖅',
	'a': '𝖆',
	'b': '𝖇',
	'c': '𝖈',
	'd': '𝖉',
	'e': '𝖊',
	'f': '𝖋',
	'g': '𝖌',
	'h': '𝖍',
	'i': '𝖎',
	'j': '𝖏',
	'k': '𝖐',
	'l': '𝖑',
	'm': '𝖒',
	'n': '𝖓',
	'o': '𝖔',
	'p': '𝖕',
	'q': '𝖖',
	'r': '𝖗',
	's': '𝖘',
	't': '𝖙',
	'u': '𝖚',
	'v': '𝖛',
	'w': '𝖜',
	'x': '𝖝',
	'y': '𝖞',
	'z': '𝖟',
	' ': ' '
}

font2 = {
	'A': 'ᗩ', 
	'B': 'ᗷ',
	'C': 'ᑢ',
	'D': 'ᕲ',
	'E': 'ᘿ',
	'F': 'ᖴ',
	'G': 'ᘜ',
	'H': 'ᕼ',
	'I': 'ᓰ',
	'J': 'ᒚ',
	'K': 'ᖽᐸ',
	'L': 'ᒪ',
	'M': 'ᘻ',
	'N': 'ᘉ',
	'O': 'ᓍ',
	'P': 'ᕵ',
	'Q': 'ᕴ',
	'R': 'ᖇ',
	'S': 'S',
	'T': 'ᖶ',
	'U': 'ᑘ',
	'V': 'ᐺ',
	'W': 'ᘺ',
	'X': '᙭',
	'Y': 'Ɏ',
	'Z': 'Ⱬ',
	'a': 'ᗩ', 
	'b': 'ᗷ',
	'c': 'ᑢ',
	'd': 'ᕲ',
	'e': 'ᘿ',
	'f': 'ᖴ',
	'g': 'ᘜ',
	'h': 'ᕼ',
	'i': 'ᓰ',
	'j': 'ᒚ',
	'k': 'ᖽᐸ',
	'l': 'ᒪ',
	'm': 'ᘻ',
	'n': 'ᘉ',
	'o': 'ᓍ',
	'p': 'ᕵ',
	'q': 'ᕴ',
	'r': 'ᖇ',
	's': 'S',
	't': 'ᖶ',
	'u': 'ᑘ',
	'v': 'ᐺ',
	'w': 'ᘺ',
	'x': '᙭',
	'y': 'Ɏ',
	'z': 'Ⱬ',

	' ': ' '
}

font3 = {
	'A': '₳', 
	'B': '฿',
	'C': '₵',
	'D': 'Đ',
	'E': 'Ɇ',
	'F': '₣',
	'G': '₲',
	'H': 'Ⱨ',
	'I': 'ł',
	'J': 'J',
	'K': '₭',
	'L': 'Ⱡ',
	'M': '₥',
	'N': '₦',
	'O': 'Ø',
	'P': '₱',
	'Q': 'Q',
	'R': 'Ɽ',
	'S': '₴',
	'T': '₮',
	'U': 'Ʉ',
	'V': 'V',
	'W': '₩',
	'X': 'Ӿ',
	'Y': 'y̷',
	'Z': 'z̷',
	'a': '₳', 
	'b': '฿',
	'c': '₵',
	'd': 'Đ',
	'e': 'Ɇ',
	'f': '₣',
	'g': '₲',
	'h': 'Ⱨ',
	'i': 'ł',
	'j': 'J',
	'k': '₭',
	'l': 'Ⱡ',
	'm': '₥',
	'n': '₦',
	'o': 'Ø',
	'p': '₱',
	'q': 'Q',
	'r': 'Ɽ',
	's': '₴',
	't': '₮',
	'u': 'Ʉ',
	'v': 'V',
	'w': '₩',
	'x': 'Ӿ',
	'y': 'y̷',
	'z': 'z̷',
	' ': ''
} 

font4 = {
	'A': 'A', 
	'B': 'B',
	'C': 'C',
	'D': 'D',
	'E': 'E',
	'F': 'F',
	'G': 'G',
	'H': 'H',
	'I': 'I',
	'J': 'J',
	'K': 'K',
	'L': 'L',
	'M': 'M',
	'N': 'N',
	'O': 'O',
	'P': 'P',
	'Q': 'Q',
	'R': 'R',
	'S': 'S',
	'T': 'T',
	'U': 'U',
	'V': 'V',
	'W': 'W',
	'X': 'X',
	'Y': 'Y',
	'Z': 'Z',
	'a': 'a', 
	'b': 'b',
	'c': 'c',
	'd': 'd',
	'e': 'e',
	'f': 'f',
	'g': 'g',
	'h': 'h',
	'i': 'i',
	'j': 'j',
	'k': 'k',
	'l': 'l',
	'm': 'm',
	'n': 'n',
	'o': 'o',
	'p': 'p',
	'q': 'q',
	'r': 'r',
	's': 's',
	't': 't',
	'u': 'u',
	'v': 'v',
	'w': 'w',
	'x': 'x',
	'y': 'y',
	'z': 'z',
	'$': '$',
	'(': '(',
	')': ')',
	'{': '{',
	'}': '}',
	'.': '.',
	'\'': '\'',
	'"': '"',
	'/': '/',
	'-': '-',
	'|': '|',
	'*': '*',
	'+': '+',
	'1': '1',
	'2': '2',
	'3': '3',
	'4': '4',
	'5': '5',
	'6': '6',
	'7': '7',
	'8': '8',
	'9': '9',
	'0': '0',
	' ': ' ',
}

def generate_render(converted_fonts):
	result = '''
		<tr>
			<td>{0}</td>
        </tr>
        
		<tr>
        	<td>{1}</td>
        </tr>
        
		<tr>
        	<td>{2}</td>
        </tr>
        
		<tr>
        	<td>{3}</td>
        </tr>

	'''.format(*converted_fonts)
	
	return Template(result).render()

def change_font(text_list):
	text_list = [*text_list]
	current_font = []
	all_fonts = []
	
	add_font_to_list = lambda text,font_type : (
		[current_font.append(globals()[font_type].get(i, ' ')) for i in text], all_fonts.append(''.join(current_font)), current_font.clear()
		) and None
	#print(dir(add_font_to_list))

	add_font_to_list(text_list, 'font1')
	add_font_to_list(text_list, 'font2')
	add_font_to_list(text_list, 'font3')
	add_font_to_list(text_list, 'font4')

	return all_fonts

def spookify(text):
	converted_fonts = change_font(text_list=text)

	return generate_render(converted_fonts=converted_fonts)

spookify("abcd")