Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BEC5786F4DD
	for <lists+nouveau@lfdr.de>; Sun,  3 Mar 2024 13:46:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B227110F310;
	Sun,  3 Mar 2024 12:46:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=leemhuis.info header.i=@leemhuis.info header.b="vESqKcY8";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
X-Greylist: delayed 2294 seconds by postgrey-1.36 at gabe;
 Sun, 03 Mar 2024 12:46:14 UTC
Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de
 [80.237.130.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5116710F310
 for <nouveau@lists.freedesktop.org>; Sun,  3 Mar 2024 12:46:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=leemhuis.info; s=he214686; h=Content-Transfer-Encoding:Content-Type:
 In-Reply-To:To:Reply-To:From:References:Cc:Subject:MIME-Version:Date:
 Message-ID:From:Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:
 Content-Type:Content-Transfer-Encoding:Content-ID:Content-Description:
 In-Reply-To:References; bh=PJwJk2t8D6bGLaekvbSUAMPsqL9sh+IsbZwuA2V5S24=;
 t=1709469974; x=1709901974; b=vESqKcY8ogKpnwDsnH1BsX2+WjHAsspvKF0zzra/S8zdbeA
 TS5qBtNtR85OcajFZld4Goiiw78O3VeHkN7xC1sKrvZSwnqnFU9DBZhjqI2AddZmRMCgVHbqGzH4p
 NoM8fLrt+CfVVYLt8CimR0xhEqEBJpgrWlM/xc7rarcQPE4O/oWd1KbIXiv8E9dKLkzW8wfDKwVIA
 71rDlEiahlJNXitjf61SEWzOQjnD9uWibXMyalbzm/QcnNeFNf9c+GUy8mkOBN7wYue0d6g/ZqUkF
 0jvfX55WiPOuQtAlBY9UJMbkl0o/jfb7GU/3QJwi/0Ds7oYedkmPzUAh/HN/JGPg==;
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
 by wp530.webpack.hosteurope.de running ExIM with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 id 1rgkdJ-0002Pq-0Q; Sun, 03 Mar 2024 13:07:57 +0100
Message-ID: <1270339f-3d35-4281-ba02-009005877877@leemhuis.info>
Date: Sun, 3 Mar 2024 13:07:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/nouveau: keep DMA buffers required for suspend/resume
Content-Language: en-US, de-DE
Cc: Sid Pranjale <sidpranjale127@protonmail.com>,
 Sid Pranjale <siddharthpranjale127@gmail.com>,
 dri-devel@lists.freedesktop.org, ML nouveau <nouveau@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>,
 Linux kernel regressions list <regressions@lists.linux.dev>,
 Karol Herbst <kherbst@redhat.com>, Lyude Paul <lyude@redhat.com>,
 Danilo Krummrich <dakr@redhat.com>
References: <20240229175822.30613-1-sidpranjale127@protonmail.com>
From: "Linux regression tracking (Thorsten Leemhuis)"
 <regressions@leemhuis.info>
To: Timur Tabi <ttabi@nvidia.com>
In-Reply-To: <20240229175822.30613-1-sidpranjale127@protonmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de; regressions@leemhuis.info; 1709469974;
 57ecc4f1; 
X-HE-SMSGID: 1rgkdJ-0002Pq-0Q
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

[adding a bunch of list and people as well as Timur Tabi, who authored
the culprit]

Sid Pranjale, thx for the report. FWIW, I'm just replying to add this to
the regression tracking to ensure it does not fall through the cracks.
Nevertheless let me mention two things while at it:

On 29.02.24 18:58, Sid Pranjale wrote:
> Nouveau deallocates a few buffers post GPU init which are required for GPU suspend/resume to function correctly.
> This is likely not as big an issue on systems where the NVGPU is the only GPU, but on multi-GPU set ups it leads to a regression where the kernel module errors and results in a system-wide rendering freeze.

These lines are too long, see
Documentation/process/submitting-patches.rst for details.

> This commit addresses that regression by moving the two buffers required for suspend and resume to be deallocated at driver unload instead of post init.
> 
> Fixes: 042b5f8 ("drm/nouveau: fix several DMA buffer leaks")

And that should be:

Fixes:  042b5f83841fbf ("drm/nouveau: fix several DMA buffer leaks")

> Signed-off-by: Sid Pranjale <sidpranjale127@protonmail.com>
> ---
>  drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
> index a64c81385..a73a5b589 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
> @@ -1054,8 +1054,6 @@ r535_gsp_postinit(struct nvkm_gsp *gsp)
>  	/* Release the DMA buffers that were needed only for boot and init */
>  	nvkm_gsp_mem_dtor(gsp, &gsp->boot.fw);
>  	nvkm_gsp_mem_dtor(gsp, &gsp->libos);
> -	nvkm_gsp_mem_dtor(gsp, &gsp->rmargs);
> -	nvkm_gsp_mem_dtor(gsp, &gsp->wpr_meta);
>  
>  	return ret;
>  }
> @@ -2163,6 +2161,8 @@ r535_gsp_dtor(struct nvkm_gsp *gsp)
>  
>  	r535_gsp_dtor_fws(gsp);
>  
> +	nvkm_gsp_mem_dtor(gsp, &gsp->rmargs);
> +	nvkm_gsp_mem_dtor(gsp, &gsp->wpr_meta);
>  	nvkm_gsp_mem_dtor(gsp, &gsp->shm.mem);
>  	nvkm_gsp_mem_dtor(gsp, &gsp->loginit);
>  	nvkm_gsp_mem_dtor(gsp, &gsp->logintr);

To be sure the issue doesn't fall through the cracks unnoticed, I'm
adding it to regzbot, the Linux kernel regression tracking bot:

#regzbot ^introduced 042b5f83841fbf
#regzbot title drm/nouveau: rendering freezes with multi-GPU setup
#regzbot ignore-activity

This isn't a regression? This issue or a fix for it are already
discussed somewhere else? It was fixed already? You want to clarify when
the regression started to happen? Or point out I got the title or
something else totally wrong? Then just reply and tell me -- ideally
while also telling regzbot about it, as explained by the page listed in
the footer of this mail.

Developers: When fixing the issue, remember to add 'Link:' tags pointing
to the report (the parent of this mail). See page linked in footer for
details.

Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)
--
Everything you wanna know about Linux kernel regression tracking:
https://linux-regtracking.leemhuis.info/about/#tldr
That page also explains what to do if mails like this annoy you.
