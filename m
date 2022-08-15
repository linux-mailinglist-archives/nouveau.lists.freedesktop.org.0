Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B5D4598EB4
	for <lists+nouveau@lfdr.de>; Thu, 18 Aug 2022 23:05:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EFA0710E61E;
	Thu, 18 Aug 2022 21:05:55 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
X-Greylist: delayed 488 seconds by postgrey-1.36 at gabe;
 Mon, 15 Aug 2022 20:49:31 UTC
Received: from resqmta-h1p-028590.sys.comcast.net
 (resqmta-h1p-028590.sys.comcast.net [IPv6:2001:558:fd02:2446::8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2EDFA14A8ED
 for <nouveau@lists.freedesktop.org>; Mon, 15 Aug 2022 20:49:31 +0000 (UTC)
Received: from resomta-h1p-028515.sys.comcast.net ([96.102.179.209])
 by resqmta-h1p-028590.sys.comcast.net with ESMTP
 id NfBJoJd4vgfn1Ngtmow1xj; Mon, 15 Aug 2022 20:41:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=comcast.net;
 s=20190202a; t=1660596082;
 bh=8Od0Z6DHVOL1tF9j5+8OtlDIo9lHRfsNgefdkSbaJq8=;
 h=Received:Received:Message-ID:Date:MIME-Version:To:From:Subject:
 Content-Type;
 b=yjJDZzwYYsSllBbRdgJMohPOgOJzAWZHoDZKCdPLyYeeSCoF14ILVec+oro9OEbBL
 Qj4R4T2nnfoRVknyPN2MAyyMoE5qVihCg9b4Rvc2hXlzUNTinNzqX8xYZ4SPPe447f
 aA8/dEmr/sHXMCv5gDk4+TCyjqe6+nohuG/MuzPvNBBoAvXkJYS1Nn3QPDTIjsykKP
 KEq0+0GnvGXlMn07zREnLMv8VjpFKTviiw5Zn0/y/Kk1+joMSq1rALhbGrEPu+GB+v
 bbpA0ukLQ5iCatiKgmulTvJoo7zdc5hf7Xqfq0kTqLR+vIW1YVTp0sfkVqdCXBLU0n
 IL7yhx0JuXYLQ==
Received: from [10.0.0.21] ([69.141.7.248])
 by resomta-h1p-028515.sys.comcast.net with ESMTPSA
 id NgtkoEXJZSGHANgtloqytZ; Mon, 15 Aug 2022 20:41:22 +0000
X-Xfinity-VAAS: gggruggvucftvghtrhhoucdtuddrgedvfedrvdehvddgudehgecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucevohhmtggrshhtqdftvghsihdpqfgfvfdppffquffrtefokffrnecuuegrihhlohhuthemuceftddunecunecujfgurhepkfffgggfvffhufgtgfesthekredttdefjeenucfhrhhomhepfdffrghvihguucfirdcurfhitghkvghtthdfuceoffgrvhhiugfirfhitghkvghtthestghomhgtrghsthdrnhgvtheqnecuggftrfgrthhtvghrnhepgedvgfdvkeetgefgffeljeevleeuhfdtvdffieelvdehvdfhgfetgfetiefhveelnecukfhppeeiledrudeguddrjedrvdegkeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhephhgvlhhopegluddtrddtrddtrddvudgnpdhinhgvthepieelrddugedurdejrddvgeekpdhmrghilhhfrhhomhepuggrvhhiughgphhitghkvghtthestghomhgtrghsthdrnhgvthdpnhgspghrtghpthhtohepuddprhgtphhtthhopehnohhuvhgvrghusehlihhsthhsrdhfrhgvvgguvghskhhtohhprdhorhhg
X-Xfinity-VMeta: sc=0.00;st=legit
Message-ID: <6e42fcba-0554-c28b-9317-88dd29db4c2b@comcast.net>
Date: Mon, 15 Aug 2022 16:41:20 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
To: nouveau@lists.freedesktop.org
Content-Language: en-US
From: "David G. Pickett" <DavidGPickett@comcast.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Thu, 18 Aug 2022 21:05:47 +0000
Subject: [Nouveau] Ubuntu 22.04 system freeze on nVidia GT218 [GeForce 210]
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

When I upgraded to Ubuntu 22.04 LTS from 20.04 LTS, it removed my 
proprietary nvidia drivers and installed nouveau.  When I run graphical 
apps like Chrome, Firefox, especially both, or even gnucash, it freezes, 
sometimes after a time seems to unfreeze, and then refreezes.  Other 
users have switched back to the nvidia proprietary driver, but I have 
not figured out how.  I had similar problems on 20.04 LTS and figured 
out how to go to nvidia, but it seems like the option is missing in 
22.04.  As a bonus for going to nvidia, BOINC apps were able to use my 
GPU.  I have a nVidia GT218 [GeForce 210] GPU, apparently part of the 
nvidia 340 family of drivers.

