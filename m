Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BD03430CD0F
	for <lists+nouveau@lfdr.de>; Tue,  2 Feb 2021 21:30:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E22876E222;
	Tue,  2 Feb 2021 20:30:18 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from audible.transient.net (audible.transient.net [24.143.126.66])
 by gabe.freedesktop.org (Postfix) with SMTP id 1CEAD8921D
 for <nouveau@lists.freedesktop.org>; Tue,  2 Feb 2021 20:26:50 +0000 (UTC)
Received: (qmail 31260 invoked from network); 2 Feb 2021 20:26:48 -0000
Received: from cucamonga.audible.transient.net (192.168.2.5)
 by canarsie.audible.transient.net with QMQP; 2 Feb 2021 20:26:48 -0000
Received: (nullmailer pid 3418 invoked by uid 1000);
 Tue, 02 Feb 2021 20:26:48 -0000
Date: Tue, 2 Feb 2021 20:26:48 +0000
From: Jamie Heilman <jamie@audible.transient.net>
To: Karol Herbst <kherbst@redhat.com>, Ben Skeggs <bskeggs@redhat.com>,
 LKML <linux-kernel@vger.kernel.org>, nouveau <nouveau@lists.freedesktop.org>
Message-ID: <YBm1iJXeDvf/Z7B4@audible.transient.net>
Mail-Followup-To: Karol Herbst <kherbst@redhat.com>,
 Ben Skeggs <bskeggs@redhat.com>,
 LKML <linux-kernel@vger.kernel.org>,
 nouveau <nouveau@lists.freedesktop.org>
References: <X+WV8OiQzTIfLdgW@audible.transient.net>
 <CACO55tt9GbwBU6igAJ_8RjwzSZcDbu+_1wGWKiye3TosgoiHyw@mail.gmail.com>
 <X/NO9kAlCd/k8Di2@audible.transient.net>
 <X/NT0iN9KlSXQJJ7@audible.transient.net>
 <X/UsBWwFR+V0hIOS@audible.transient.net>
 <CACO55ttrFCOzREQxi3+SSaCSsAP1bEUBEt78ajkRGQQU1xYxtw@mail.gmail.com>
 <YAjn9jR+d2zRfNjb@audible.transient.net>
 <CACO55tu+5vv3dU3+O=DGDo9EdcyqFtpF4WR-VNj5eo89WMSfpw@mail.gmail.com>
 <YAtMEGJxlRklqYw8@audible.transient.net>
 <YAtxgP6YJJwcotuA@audible.transient.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YAtxgP6YJJwcotuA@audible.transient.net>
X-Mailman-Approved-At: Tue, 02 Feb 2021 20:30:17 +0000
Subject: Re: [Nouveau] nouveau regression post v5.8, still present in v5.10
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

Jamie Heilman wrote:
> Jamie Heilman wrote:
> > Karol Herbst wrote:
> > > fyi, there is a patch which solves a maybe related issue on your GPU,
> > > mind giving it a try before we dig further?
> > > https://gitlab.freedesktop.org/drm/nouveau/-/issues/14#note_767791
> > 
> > So, I tried that.  Turns out, I can still trigger a problem.  Is it
> > the same problem?  Maybe?  I also tried applying the patch from 
> > 
> > ca386aa7155a ("drm/nouveau/kms/nv50-gp1xx: add WAR for EVO push buffer HW bug")
> > to 5.8.0-rc6-01516-g0a96099691c8 and very interestingly, it changed
> > the mode of failure to same thing I saw with 5.10.9 patched with the patch
> > from that bug report.  In both cases I get this in the log:
> > 
> > kern.err: nouveau 0000:01:00.0: Xorg[2243]: nv50cal_space: -16
> > kern.err: nouveau 0000:01:00.0: Xorg[2243]: nv50cal_space: -16
> > kern.err: nouveau 0000:01:00.0: Xorg[2243]: nv50cal_space: -16
> > kern.err: nouveau 0000:01:00.0: Xorg[2243]: nv50cal_space: -16
> > ...
> > and so on
> > 
> > In one incident my monitor would't even wake up anymore after this.
> > 
> > 
> > I'm trying to repo it now on an unpatched 5.8.0-rc6-01515-gae09163ac27c
> > right now, as running glxgears does seem to help reproduce problems
> > faster which is nice, I'm just not entirely sure it's the same set of
> > problems; hopefully that version is free from issues, but we'll
> > see...
> 
> Ugh, well I can crash 5.8.0-rc6-01515-gae09163ac27c and 5.8.18 in
> basically the same way running glxgears and a xset dpms force off
> loop.  So I'm starting to think it's not the same thing, and that
> problem has been latent from before I started having periodic issues.
> 
> I should note that my exact testing technique for the above was to run
> 4 copies of glxgears and the xset force dpms off loop at the same
> time.  Really looks more like it triggers a resource starvation issue
> maybe.  The crash is also worse, particularly if I don't do anything
> about it right away as my workstation eventually falls off the network
> and I'm forced to power cycle it; the crashes I was chasing after
> wouldn't do quite that much violence, normally I could still log in,
> rebuild a kernel, and shut things down cleanly.
> 
> More than one bug here I suspect.

OK, I went back and bisected again while patching known issues to get
a better idea what was causing the problem I've been having and I'm
confident it was the bug which Bastian Beranek's patch (now in
mainline) addressed.  My original bisection got confused by the
EVO push buffer HW bug which was fixed in ca386aa7155a54.  Once I
bisected with the patch from ca386aa7155a54 applied, my bisection
landed on f844eb485eb05 and Bastian Beranek's patch fixed that right
up.

'course I remain mildly concerned I can crash the kernel with little
more than glxgears and xset ... but the original stability problem I
reported I can safely say has been fixed.  If I can figure out the
nature of what I suspect is unrecoverable resource starvation, I'll
start a new thread for that.


-- 
Jamie Heilman                     http://audible.transient.net/~jamie/
_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
