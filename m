Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 79B6932EC64
	for <lists+nouveau@lfdr.de>; Fri,  5 Mar 2021 14:40:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E227C6E20E;
	Fri,  5 Mar 2021 13:40:25 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
X-Greylist: delayed 1787 seconds by postgrey-1.36 at gabe;
 Fri, 05 Mar 2021 13:40:24 UTC
Received: from re-prd-fep-041.btinternet.com (mailomta25-re.btinternet.com
 [213.120.69.118])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 509C06E20E
 for <nouveau@lists.freedesktop.org>; Fri,  5 Mar 2021 13:40:24 +0000 (UTC)
Received: from re-prd-rgout-004.btmx-prd.synchronoss.net ([10.2.54.7])
 by re-prd-fep-046.btinternet.com with ESMTP id
 <20210305131035.IFNH17749.re-prd-fep-046.btinternet.com@re-prd-rgout-004.btmx-prd.synchronoss.net>
 for <nouveau@lists.freedesktop.org>; Fri, 5 Mar 2021 13:10:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=btopenworld.com;
 s=btmx201904; t=1614949835; 
 bh=Tt0rGBwb/1ZQWmCj97Vo6+xMpbZk0QtgLqNjShKRF+4=;
 h=To:From:Subject:Message-ID:Date:MIME-Version;
 b=DT3DrOpSl48KbFyF8FJ7wQ0eytUGGJF70MVzm3OvZLmr8ZiZUPDY2FZW3TxgouMNxUqju8oozGlkoFQzYTklZEgpsmK1Q7T3GSOm0avr51Bkf4UWdwONRfIJ/9HA4gPQYMUOHfVt2R7hL4m5YDL3+RIUxYbDjLAjd7JoHWMjGs0uACUH4tO2Vws5daa71rrbDtQ4vPJIZZtcZg1WfST3uaT7WCG0RJpwgk3/0tA5C7dNg/59aVJXfnR1MOiSDqmTZyVOdptvdsqqLbad6zo1DWHyXp2P5u+JT+xxlxWelaeqbv0lN6pyesV7enSzTKYRvotRbPUoqosK214IXKvZtA==
Authentication-Results: btinternet.com;
 auth=pass (PLAIN) smtp.auth=graemebrett.houston@btopenworld.com
X-SNCR-Rigid: 5ED9C5062955E2DD
X-Originating-IP: [81.140.186.120]
X-OWM-Source-IP: 81.140.186.120 (GB)
X-OWM-Env-Sender: graemebrett.houston@btinternet.com
X-VadeSecure-score: verdict=clean score=0/300, class=clean
X-RazorGate-Vade: gggruggvucftvghtrhhoucdtuddrgeduledruddtiedggeeiucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuueftkffvkffujffvgffngfevqffopdfqfgfvnecuuegrihhlohhuthemuceftddunecunecujfgurhepvffhuffkffgfgggtgfesthejredttdefjeenucfhrhhomhepifhrrggvmhgvuceurhgvthhtucfjohhushhtohhnuceoghhrrggvmhgvsghrvghtthdrhhhouhhsthhonhessghtohhpvghnfihorhhlugdrtghomheqnecuggftrfgrthhtvghrnhepveehvdfhfeetleeuvdeuudefgffggfdugfeuudfgfefhhefgjefgvedtgfduleegnecukfhppeekuddrudegtddrudekiedruddvtdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhephhgvlhhopegludelvddrudeikedrtddrvddtngdpihhnvghtpeekuddrudegtddrudekiedruddvtddpmhgrihhlfhhrohhmpeeoghhrrggvmhgvsghrvghtthdrhhhouhhsthhonhessghtihhnthgvrhhnvghtrdgtohhmqecuuefqffgjpeekuefkvffokffogfdprhgtphhtthhopeeonhhouhhvvggruheslhhishhtshdrfhhrvggvuggvshhkthhophdrohhrgheq
X-RazorGate-Vade-Verdict: clean 0
X-RazorGate-Vade-Classification: clean
X-SNCR-hdrdom: btopenworld.com
Received: from [192.168.0.20] (81.140.186.120) by
 re-prd-rgout-004.btmx-prd.synchronoss.net (5.8.340) (authenticated as
 graemebrett.houston@btopenworld.com)
 id 5ED9C5062955E2DD for nouveau@lists.freedesktop.org;
 Fri, 5 Mar 2021 13:10:35 +0000
To: nouveau@lists.freedesktop.org
From: Graeme Brett Houston <graemebrett.houston@btopenworld.com>
Message-ID: <6f69148e-b0c8-03ba-c4de-96afee5362c0@btopenworld.com>
Date: Fri, 5 Mar 2021 13:10:34 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
Content-Language: en-US
Subject: [Nouveau] VFIO traceing + Nvidia Cards
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

Hi i was looking to find out if there is any tools that can be used to 
capture guaranteed repeatable trases of Nvidia Registers using VFIO VGA 
pass through?


my understanding is envytools works on linux where i was thinking to get 
traces of what nvidia drivers/hardware are doing via VFIO pass through 
of the pci/pcie card, running windows doing a standard set of tests.


Also on such a setup what parameters would need to be sent to qemu and 
what extar compile settings would be used?


i have tried this with PowerVR card and get traces but don't think i get 
all the DMA activity however but as that is a separate 3d accelerator 
and i have not manged ot get old vga cards of that erra working in vfio 
pass through that explains that .


But i was thinking for RTX 4000 i could potentially grab register 
accesses as a trace but as i say recon would need a standard test 
process to follow.



Graeme Houston

_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
