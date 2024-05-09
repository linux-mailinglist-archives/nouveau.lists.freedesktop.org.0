Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 992CB8C0E33
	for <lists+nouveau@lfdr.de>; Thu,  9 May 2024 12:31:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6DADB10E184;
	Thu,  9 May 2024 10:31:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=leemhuis.info header.i=@leemhuis.info header.b="nqLaOaL9";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de
 [80.237.130.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7BA6710E184
 for <nouveau@lists.freedesktop.org>; Thu,  9 May 2024 10:31:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=leemhuis.info; s=he214686; h=Content-Transfer-Encoding:Content-Type:
 In-Reply-To:References:Cc:To:Reply-To:Subject:From:MIME-Version:Date:
 Message-ID:From:Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:
 Content-Type:Content-Transfer-Encoding:Content-ID:Content-Description:
 In-Reply-To:References; bh=/EtjPJ49eLErfTct4IwKUEDvnMD7g5S++qk8eNGdasU=;
 t=1715250692; x=1715682692; b=nqLaOaL9xOtnMBslwbqAat5KRadUxMt9due37FNduXBx5tZ
 eosNBJtIWpOPcGWelwQdHv8Wv5yVg+D1uO60BJoFLX6qFB5u8VkX0ZuffbtWXBYTTgI3NEQ8BVxvY
 vEJxYXYqrP9mayFTvTKc23eG9q5gZ9w7WXCCu1xw5ISG3TCOCFG03gO1af4o3zQMGGv5G8TQyo4CP
 6F8QCDHMLgbtJ/DUKSRnrF9k02s9G6SbdDWBDwkVTX6jPxizJPBf57rn54XHSRcCOLxqPsDB8kl2u
 ziZjUteUcQGWhCJt4B2nB0XByqh1JDOel6IoPEEVXaYUXs6MyGVN0w+D5HTqw8RQ==;
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
 by wp530.webpack.hosteurope.de running ExIM with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 id 1s513e-0006hG-9J; Thu, 09 May 2024 12:31:26 +0200
Message-ID: <ba0bc464-a06a-4c54-945a-202dca2c4e49@leemhuis.info>
Date: Thu, 9 May 2024 12:31:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: "Linux regression tracking (Thorsten Leemhuis)"
 <regressions@leemhuis.info>
Subject: Re: [REGRESSION] v6.9-rc7: nouveau: init failed, no display output
 from kernel; successfully bisected
To: lyude@redhat.com
Cc: kherbst@redhat.com, dakr@redhat.com, airlied@redhat.com,
 stable@vger.kernel.org,
 Linux kernel regressions list <regressions@lists.linux.dev>,
 Dan Moulding <dan@danm.net>, nouveau@lists.freedesktop.org
References: <20240506182331.8076-1-dan@danm.net>
Content-Language: en-US, de-DE
In-Reply-To: <20240506182331.8076-1-dan@danm.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de; regressions@leemhuis.info; 1715250692;
 fb480b2c; 
X-HE-SMSGID: 1s513e-0006hG-9J
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
Reply-To: Linux regressions mailing list <regressions@lists.linux.dev>
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On 06.05.24 20:23, Dan Moulding wrote:
> After upgrading to rc7 from rc6 on a system with NVIDIA GP104 using
> the nouveau driver, I get no display output from the kernel (only the
> output from GRUB shows on the primary display). Nonetheless, I was
> able to SSH to the system and get the kernel log from dmesg. I found
> errors from nouveau in it. Grepping it for nouveau gives me this:
> 
> [    0.367379] nouveau 0000:01:00.0: NVIDIA GP104 (134000a1)
> [    0.474499] nouveau 0000:01:00.0: bios: version 86.04.50.80.13
> [    0.474620] nouveau 0000:01:00.0: pmu: firmware unavailable
> [    0.474977] nouveau 0000:01:00.0: fb: 8192 MiB GDDR5
> [    0.484371] nouveau 0000:01:00.0: sec2(acr): mbox 00000001 00000000
> [    0.484377] nouveau 0000:01:00.0: sec2(acr):load: boot failed: -5
> [    0.484379] nouveau 0000:01:00.0: acr: init failed, -5
> [    0.484466] nouveau 0000:01:00.0: init failed with -5
> [    0.484468] nouveau: DRM-master:00000000:00000080: init failed with -5
> [    0.484470] nouveau 0000:01:00.0: DRM-master: Device allocation failed: -5
> [    0.485078] nouveau 0000:01:00.0: probe with driver nouveau failed with error -50
> 
> I bisected between v6.9-rc6 and v6.9-rc7 and that identified commit
> 52a6947bf576 ("drm/nouveau/firmware: Fix SG_DEBUG error with
> nvkm_firmware_ctor()") as the first bad commit.

Lyude, that's a commit of yours.

Given that 6.9 is due a quick question: I assume there is no easy fix
for this in sight? Or is a quick revert something that might be
appropriate to prevent this from entering 6.9?

Ciao, Thorsten

> I then rebuilt
> v6.9-rc7 with just that commit reverted and the problem does not
> occur.
> 
> Please let me know if there are any additional details I can provide
> that would be helpful, or if I should reproduce the failure with
> additional debugging options enabled, etc.
> 
> Cheers,
> 
> -- Dan
