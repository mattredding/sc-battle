$.Class.extend("Track",
// static properties
{
  count: 0
},
// prototype properties
{
  // constructor function
  init : function(battle_id, track_id, title, permalink_url, votes, votedFor, parent){
	this.battle_id = battle_id;
	this.track_id = track_id;
	this.title = title;
	this.permalink_url = permalink_url;
	this.votes = votes;
	this.votedFor = votedFor;
	this.parent = parent;

	var div = $('<div/>');
	
	var voteCountSpan = $('<span/>')
	voteCountSpan.attr('id', 'votes')
	.text(' (Votes: '+votes+')')
	
	var voteSpan = $("<span/>")
	voteSpan.text("Vote")
	.bind('click', function(){
		console.log("vote clicked ");
		$(".your_vote").removeClass('your_vote');
		var self = $(this);
		$.get('/vote/cast?track_id='+track_id+'&battle_id='+battle_id, function(response){
			console.log("vote registered ");
			self.addClass('your_vote');
			// 	ToDo: update vote counts
		})
	})
	if(votedFor == "true"){
		voteSpan.text("Voted")
		.addClass('your_vote')
	}
		
	var trackLink = $('<a/>');
	trackLink.text(title)
	trackLink.attr('href', permalink_url)
	trackLink.addClass('sc-player')
	
	div.append(voteSpan, voteCountSpan, trackLink);
	parent.append(div);

	//increment the static count
    this.Class.count++;
  }
})