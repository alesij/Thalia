//
//  Script.swift
//  Thalia
//
//  Created by Alessio Di Matteo on 21/02/2020.
//  Copyright © 2020 Samuel Kebis. All rights reserved.
//

import Foundation

class Script: Codable {
    var title : String
    var sentence : [Sentence] = [
    Sentence("SAMPSON", "Gregory, o' my word, we'll not carry coals."),
    Sentence("GREGORY", "No, for then we should be colliers."),
    Sentence("SAMPSON", "I mean, an we be in choler, we'll draw."),
    Sentence("GREGORY", "Ay, while you live, draw your neck out o' the collar."),
    Sentence("SAMPSON", "I strike quickly, being moved."),
    Sentence("GREGORY", "But thou art not quickly moved to strike."),
    Sentence("SAMPSON", "A dog of the house of Montague moves me."),
    Sentence("GREGORY", "To move is to stir; and to be valiant is to stand: therefore, if thou art moved, thou runn'st away."),
    Sentence("SAMPSON", "A dog of that house shall move me to stand: I will take the wall of any man or maid of Montague's."),
    Sentence("GREGORY", "That shows thee a weak slave; for the weakest goes to the wall."),
    Sentence("SAMPSON", "True; and therefore women, being the weaker vessels, are ever thrust to the wall: therefore I will push Montague's men from the wall, and thrust his maids to the wall."),
    Sentence("GREGORY", "The quarrel is between our masters and us their men."),
    Sentence("SAMPSON", "'Tis all one, I will show myself a tyrant: when I have fought with the men, I will be cruel with the maids, and cut off their heads."),
    Sentence("GREGORY", "The heads of the maids?"),
    Sentence("SAMPSON", "Ay, the heads of the maids, or their maidenheads; take it in what sense thou wilt."),
    Sentence("GREGORY", "They must take it in sense that feel it."),
    Sentence("SAMPSON", "Me they shall feel while I am able to stand: and 'tis known I am a pretty piece of flesh."),
    Sentence("GREGORY", "'Tis well thou art not fish; if thou hadst, thou hadst been poor John. Draw thy tool! here comes two of the house of the Montagues."),
    Sentence("SAMPSON", "My naked weapon is out: quarrel, I will back thee."),
    Sentence("GREGORY", "How! turn thy back and run?"),
    Sentence("SAMPSON", "Fear me not."),
    Sentence("GREGORY", "No, marry; I fear thee!"),
    Sentence("SAMPSON", "Let us take the law of our sides; let them begin."),
    Sentence("GREGORY", "I will frown as I pass by, and let them take it as"),
    Sentence("SAMPSON", "Nay, as they dare. I will bite my thumb at them; which is a disgrace to them, if they bear it."),
    Sentence("ABRAHAM", "Do you bite your thumb at us, sir?"),
    Sentence("SAMPSON", "I do bite my thumb, sir."),
    Sentence("ABRAHAM", "Do you bite your thumb at us, sir?"),
    Sentence("SAMPSON", "[Aside to GREGORY] Is the law of our side, if I sayay?"),
    Sentence("GREGORY", "No"),
    Sentence("SAMPSON", "No, sir, I do not bite my thumb at you, sir, but Ibite my thumb, sir."),
    Sentence("GREGORY", "Do you quarrel, sir?"),
    Sentence("ABRAHAM", "Quarrel sir! no, sir."),
    ]
    
    init(title : String) {
        self.title = title
}
}
