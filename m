Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 942E567FA18
	for <lists+nouveau@lfdr.de>; Sat, 28 Jan 2023 18:51:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B409310E1ED;
	Sat, 28 Jan 2023 17:51:20 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BCAD110E1ED
 for <nouveau@lists.freedesktop.org>; Sat, 28 Jan 2023 17:51:18 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id E881ACE0CEA;
 Sat, 28 Jan 2023 17:51:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 927A0C433EF;
 Sat, 28 Jan 2023 17:51:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1674928272;
 bh=pm5BQzLuamzV2NyRq5J6gigouQmXGBehlLO/cOO/iQk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=f6XbD3ih1aKLJG2pUh2Zb4qOdabiRlpNiljSCyDMWF+m0IUD2f4WibHfyBSrcnGO1
 S2qb1l64oNSKDusmhvfbtdEx3uDnFbbxH4AKbyQE6oTOynkADuO9H09k6EsKnpXQhj
 r1jIEx1Hc6GGpcE7frcADCeyuj4Y1xd5f1jDyqY0=
Date: Sat, 28 Jan 2023 18:51:08 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Computer Enthusiastic <computer.enthusiastic@gmail.com>
Message-ID: <Y9VgjLneuqkl+Y87@kroah.com>
References: <20220819200928.401416-1-kherbst@redhat.com>
 <CAHSpYy0HAifr4f+z64h+xFUmMNbB4hCR1r2Z==TsB4WaHatQqg@mail.gmail.com>
 <CACO55tv0jO2TmuWcwFiAUQB-__DZVwhv7WNN9MfgMXV053gknw@mail.gmail.com>
 <CAHSpYy117N0A1QJKVNmFNii3iL9mU71_RusiUo5ZAMcJZciM-g@mail.gmail.com>
 <cdfc26b5-c045-5f93-b553-942618f0983a@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cdfc26b5-c045-5f93-b553-942618f0983a@gmail.com>
Subject: Re: [Nouveau] [PATCH] nouveau: explicitly wait on the fence in
 nouveau_bo_move_m2mf
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
Cc: nouveau@lists.freedesktop.org, stable@vger.kernel.org,
 Ben Skeggs <bskeggs@redhat.com>, Salvatore Bonaccorso <carnil@debian.org>
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On Sat, Jan 28, 2023 at 03:49:59PM +0100, Computer Enthusiastic wrote:
> Hello,
> 
> The patch "[Nouveau] [PATCH] nouveau: explicitly wait on the fence in
> nouveau_bo_move_m2mf" [1] was marked for kernels v5.15+ and it was merged
> upstream.
> 
> The same patch [1] works with kernel 5.10.y, but it is not been merged
> upstream so far.
> 
> According to Karol Herbst suggestion [2], I'm sending this message to ask
> for merging it into 5.10 kernel.

We need to know the git commit id.  And have you tested it on 5.10.y?
And why are you stuck on 5.10.y for this type of hardware?  Why not move
to 5.15.y or 6.1.y?

And as my bot says:

<formletter>

This is not the correct way to submit patches for inclusion in the
stable kernel tree.  Please read:
    https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html
for how to do this properly.

</formletter>

thanks,

greg k-h
