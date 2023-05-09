Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 40EE76FC94B
	for <lists+nouveau@lfdr.de>; Tue,  9 May 2023 16:42:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B39BF10E370;
	Tue,  9 May 2023 14:42:06 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail1.merlins.org (magic.merlins.org [209.81.13.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B261C10E377
 for <nouveau@lists.freedesktop.org>; Tue,  9 May 2023 14:42:05 +0000 (UTC)
Received: from svh-gw.merlins.org ([76.132.34.178]:36572
 helo=sauron.svh.merlins.org) by mail1.merlins.org with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim
 4.94.2 #2)
 id 1pwNan-00009X-5b by authid <merlins.org> with srv_auth_plain;
 Tue, 09 May 2023 07:41:45 -0700
Received: from merlin by sauron.svh.merlins.org with local (Exim 4.92)
 (envelope-from <marc_nouveau@merlins.org>)
 id 1pwOXA-002UeI-PU; Tue, 09 May 2023 07:41:44 -0700
Date: Tue, 9 May 2023 07:41:44 -0700
From: Marc MERLIN <marc_nouveau@merlins.org>
To: Steven Kucharzyk <stvr_8888@comcast.net>
Message-ID: <20230509144144.GQ3737138@merlins.org>
References: <20230504233216.GJ1191678@merlins.org>
 <20230504224321.2b8b2f54@n2pa> <20230505041111.GS13387@merlins.org>
 <20230505135650.1be375cf@n2pa>
 <20230508003226.GE3737138@merlins.org>
 <20230508173838.12ee86e2@n2pa>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230508173838.12ee86e2@n2pa>
X-Sysadmin: BOFH
X-URL: http://marc.merlins.org/
X-SA-Exim-Connect-IP: 76.132.34.178
X-SA-Exim-Mail-From: marc_nouveau@merlins.org
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
Cc: Dan Carpenter <error27@gmail.com>, Ajay Gupta <ajayg@nvidia.com>,
 nouveau@lists.freedesktop.org, Zheng Wang <zyytlz.wz@163.com>,
 "Jiri Slaby \(SUSE\)" <jirislaby@kernel.org>,
 Jiapeng Chong <jiapeng.chong@linux.alibaba.com>,
 "Vlastimil Babka \(SUSE\)" <vbabka@kernel.org>, Lee Jones <lee@kernel.org>,
 Yang Yingliang <yangyingliang@huawei.com>, Ricardo Garcia <rgarcia@igalia.com>,
 "Tian, Kevin" <kevin.tian@intel.com>, Chris Clayton <chris2553@googlemail.com>,
 John Ogness <john.ogness@linutronix.de>,
 Niklas Schnelle <schnelle@linux.ibm.com>, korantwork@gmail.com,
 Shahab Vahedi <shahab.vahedi@gmail.com>, Tanmay Bhushan <007047221b@gmail.com>,
 Ben Dooks <ben-linux@fluff.org>, Arnd Bergmann <arnd@kernel.org>,
 Sergey Shtylyov <s.shtylyov@omp.ru>, kernel test robot <yujie.liu@intel.com>,
 Deepak R Varma <drv@mailo.com>,
 Somalapuram Amaranath <Amaranath.Somalapuram@amd.com>, yang.yang29@zte.com.cn,
 Yang Li <yang.lee@linux.alibaba.com>, Timothy Madden <terminatorul@gmail.com>,
 Zack Rusin <zackr@vmware.com>, Baolu Lu <baolu.lu@linux.intel.com>
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

To the noueau devs:
Is there an appropriate list/forum to get support for nouveau,
or is this the list?
The nvidia support forums seem to be for the binary nvidia driver
which I'm not running.

On Mon, May 08, 2023 at 05:38:38PM -0500, Steven Kucharzyk wrote:
> I understand parts of your motivation in how you want to deal with
> Nvidia.  Without knowing what you have or have not done in your
> past efforts and what those results were, my diagnostic approach would
> start by verifying that the HW (chip) is not damaged by previous
> experiments or from the get go. Here's a link to a python gpu test app. 
> Hope that helps.
> https://www.geeks3d.com/gputest/download/
 
Sure, although for now, it of course runs on my main GPU, the intel one,
so that does not help much.

> First things, is to prove the chip works, then that target delivery
> (cables etc.) works then reduce down to your desired working setup.
> Lastly and I'm sure that you are aware that Nouveau is AMD centric ...
> opensuse is darn right hostile while redhat(ibm) not so much so.
> Lastly, Nvidia (xCFG) manual highlights numerous optional cmds for fine
> grain control that's not in  the gui depending on what you're going for.
> ( know thy enemy)

I already know the chip and cable work (although I did swap cables), as
per my original report with debug info, the screen comes on and I see a
mouse cursor but nothing else. It mirrors the cursor on the HDMI output
connected to the nvidia chip from my main display on intel, but it does
not mirror the framebuffer.

I realize that few people likely have my setup (dual chip laptop), I got
it to work with nouveau on my with P70 with an older nvidia chip, at
this point I would *so* love for anyone working on this project to tell
me whether it's supposed to work or whether it has never been
tested/confirmed to work yet.
Of if I'm spamming the wrong forum, I will happily move a better place.

Thanks,
Marc
-- 
"A mouse is a device used to point at the xterm you want to type in" - A.S.R.
 
Home page: http://marc.merlins.org/                       | PGP 7F55D5F27AAF9D08
