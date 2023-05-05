Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 69FB26F7BAA
	for <lists+nouveau@lfdr.de>; Fri,  5 May 2023 05:51:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D3D2710E555;
	Fri,  5 May 2023 03:51:38 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
X-Greylist: delayed 488 seconds by postgrey-1.36 at gabe;
 Fri, 05 May 2023 03:51:36 UTC
Received: from resdmta-h1p-028598.sys.comcast.net
 (resdmta-h1p-028598.sys.comcast.net [IPv6:2001:558:fd02:2446::e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3721510E555
 for <nouveau@lists.freedesktop.org>; Fri,  5 May 2023 03:51:36 +0000 (UTC)
Received: from resomta-h1p-027919.sys.comcast.net ([96.102.179.208])
 by resdmta-h1p-028598.sys.comcast.net with ESMTP
 id ulEDpJ6i0LXV2umLspR8Fv; Fri, 05 May 2023 03:43:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=comcast.net;
 s=20190202a; t=1683258204;
 bh=vzO9qhCQKXqOt3XxLBWqq+VVY1Xz2zEkhLKBMNCiSJE=;
 h=Received:Received:Date:From:To:Subject:Message-ID:MIME-Version:
 Content-Type:Xfinity-Spam-Result;
 b=kQ05hfvSXnYGFLwAVzZiCtxYruedNgKpZPSYV0DLQ1/OrZN7LztgXvNZVLACR68ON
 g3y7kKeKVvHp3I+SLVNPX9OvjT5YaWhcKV/r5bph1YlYb6CENk3PeoP0Wttw74Ei5n
 2PRTi57/7UkSIU9M1KSQMRFr0ZwoTWQzelTO8D1t26tMqVxIXx/jvzIznsW7WoRhxd
 m+eWcedCSCOn9N0s5tlyE+nRvRiAHmAz+1qTuGJqcN+k9Jr43AOBxnh1C1FCvPT4YV
 MohNyObF/PyqAqil4G7jC4fwawgI503lv6FhGqI3mi51bB5GXyQMIIrC/4NrZqSeEZ
 8vDkAJZwZ/Irg==
Received: from n2pa ([98.222.130.155])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 256/256 bits)
 (Client did not present a certificate)
 by resomta-h1p-027919.sys.comcast.net with ESMTPSA
 id umLqp3NNhTsjOumLrpYq5J; Fri, 05 May 2023 03:43:24 +0000
X-Xfinity-VAAS: gggruggvucftvghtrhhoucdtuddrgedvhedrfeefuddgjeeiucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuvehomhgtrghsthdqtfgvshhipdfqfgfvpdfpqffurfetoffkrfenuceurghilhhouhhtmecufedtudenucenucfjughrpeffhffvuffkjghfohfogggtgfesthejredtredtvdenucfhrhhomhepufhtvghvvghnucfmuhgthhgrrhiihihkuceoshhtvhhrpgekkeekkeestghomhgtrghsthdrnhgvtheqnecuggftrfgrthhtvghrnhepkefgueekuddtieeliefhteejteelffektdeftdejtddugfetgfeuieeigeehueeunecukfhppeelkedrvddvvddrudeftddrudehheenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhephhgvlhhopehnvdhprgdpihhnvghtpeelkedrvddvvddrudeftddrudehhedpmhgrihhlfhhrohhmpehsthhvrhgpkeekkeeksegtohhmtggrshhtrdhnvghtpdhnsggprhgtphhtthhopedupdhrtghpthhtohepnhhouhhvvggruheslhhishhtshdrfhhrvggvuggvshhkthhophdrohhrgh
X-Xfinity-VMeta: sc=0.00;st=legit
Date: Thu, 4 May 2023 22:43:21 -0500
From: Steven Kucharzyk <stvr_8888@comcast.net>
To: nouveau@lists.freedesktop.org
Message-ID: <20230504224321.2b8b2f54@n2pa>
In-Reply-To: <20230504233216.GJ1191678@merlins.org>
References: <20230504233216.GJ1191678@merlins.org>
Organization: No2Alike
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.34; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Subject: Re: [Nouveau] 6.2 still cannot get hdmi display out on Thinkpad P73
 Quadro RTX 4000 Mobile/TU104
X-BeenThere: nouveau@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request@lists.freedesktop.org?subject=subscribe>
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On Thu, 4 May 2023 16:32:16 -0700
Marc MERLIN <marc_nouveau@merlins.org> wrote:

> Hi again, I just saw a bunch of commits from all of you (thanks), but
> still can't find info if my thinkpad P73 with Quadro RTX 4000
> Mobile/TU104 is meant to be supported, or not, and if so, how I can
> best report issues beyond what I've already sent.
> 
> The intel graphics works great thankfully, but I do need to use HDMI
> out from time to time, which is only wired to the nvidia chip
> unfortunately.
> 
> Guidance would be very appreciated.
> 
> Thanks,
> Marc

I'm going to take a leap here ...

any UEFI ? TSM ?

In the spec's that I looked at Lenovo's ThinkPad P73 FHD / 4K UHD
personally I found it interesting that the "up to" Nvidia Quadro RTX
5000 was listed as "Discrete" vs. the UHD Graphics 620 (24 EUs) as
"Integrated".  Are you 4K?

I see it TB3's and that could mean that if you're going 4K you'd want
to be using those ... a guess since I have neither.

HDMI ... I have had issues with Laps + HDMI when plugging the cable
into an already turn-on monitor. I have taken DVI-I > DP cables just to
see ... Next I didn't see any reference to Nvidia drivers is that your
option ? (I know, I live with bane of a "tainted kernel" because of
them and flop back and forth to see how Nouveau is progressing)

Either my eye's are getting worse or I missed what O/s your running ...
not sure that's the issue or drivers and possibly HDMI & TB.


