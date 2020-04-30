Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A48BD1BF185
	for <lists+nouveau@lfdr.de>; Thu, 30 Apr 2020 09:33:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB40A6EB70;
	Thu, 30 Apr 2020 07:33:11 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A0D06EB61
 for <nouveau@lists.freedesktop.org>; Thu, 30 Apr 2020 07:32:47 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id k12so665199wmj.3
 for <nouveau@lists.freedesktop.org>; Thu, 30 Apr 2020 00:32:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=gGe2NHAnpLJewKteOaS5mIF6HhRadzzMbfDOZ6+dAOw=;
 b=b3k5rUoiVpT7ABTgx6u0RB2BLs/zLwpU+JlsHl9Tk+YqoFkhUD2Mcq17MY85HRPv9H
 DnV2nX9ZP83aEqtmwiHMW8yZQ6ZahmCASTtRtH+MqJo1LDUzLNP+2KONDx8FVOuNBhiT
 0kZ3D0782ODL2NEydO5VCtNsj3CJrxOgYMs1DEudMdFDnKYt86DnyPF2nYFiXxuyZyAY
 PWLQlxumNYUsTLAzBuE/DIN8L1kMiVcAE2vCfxXEDgaiDxx/1VAlKq2AX1jpZf7hm81m
 /LycvrFlvxbgLm9bmshq22JMR3iIpreu9mhOlYyVH9doCRZRDCk3VKXSMIcNU23q7dqG
 v0fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=gGe2NHAnpLJewKteOaS5mIF6HhRadzzMbfDOZ6+dAOw=;
 b=TXkhQffcqiEIX43gV4jM5tXxuCx71eorQFFXh9mJnCuTXQBQLzhgZqNv0ac7XApQfg
 SQVff0QbiX7MxGQnMTw/6FZaUkssjCZHOJLrf5HiUMt3qrLjuiMl9dWZ0BnwS92XrZek
 wmJos2oW6A5KqOWhhT9QKoT4y8KB02ktLVG6MvxBu2t4v0fneLM7Vr/6AsR0M75AEbHe
 jy3/sFQUmTyNtnoRxyzjtZPYrhxv8/xbNGKJRboSfyb7yboY+vcTVH3RJaeachv0Lldz
 Sgnf5aUiAsUHnBlz1z0QWIHf8oXxOo7jzgGEjn4K/tNKQ9lPXy5OiHtm1DSChUlZJG+q
 0Hhg==
X-Gm-Message-State: AGi0PuY4BchzsY0/gTPY+dUjda40DZQ8s8pTMteka2hMIC/D0DDLYlcT
 rNCfO4VTnzXdB1bDEujuIg==
X-Google-Smtp-Source: APiQypLiLg52SoQdbxplASaKUTg1M7ZjIWjBAY6MRMGrx3bUv+ERCFRK1wT1hDA0Dukws2DbZF/XJA==
X-Received: by 2002:a1c:4603:: with SMTP id t3mr1403779wma.103.1588231965611; 
 Thu, 30 Apr 2020 00:32:45 -0700 (PDT)
Received: from avx2 ([46.53.252.178])
 by smtp.gmail.com with ESMTPSA id t2sm11101621wmt.15.2020.04.30.00.32.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Apr 2020 00:32:44 -0700 (PDT)
Date: Thu, 30 Apr 2020 10:32:43 +0300
From: Alexey Dobriyan <adobriyan@gmail.com>
To: Ilia Mirkin <imirkin@alum.mit.edu>
Message-ID: <20200430073243.GA8620@avx2>
References: <20200401185621.GA24692@avx2>
 <CAKb7UvhLF7Qdx7W_0Ft4G8NujW6XbELcCP09DSkubj_duBXVkg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAKb7UvhLF7Qdx7W_0Ft4G8NujW6XbELcCP09DSkubj_duBXVkg@mail.gmail.com>
Subject: Re: [Nouveau] gp104: regression on Linux 5.6
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
Cc: nouveau <nouveau@lists.freedesktop.org>, Ben Skeggs <bskeggs@redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On Thu, Apr 30, 2020 at 12:15:28AM -0400, Ilia Mirkin wrote:
> Hi Alexey,
> 
> On Fri, Apr 24, 2020 at 10:52 PM Alexey Dobriyan <adobriyan@gmail.com> wrote:
> >
> > gp104 refuses to switch to "graphic" mode and show anything past
> > this line:
> >
> >         fb0: switching to nouveaufb from EFI VGA
> >
> > Machine is fine, as it I can press Ctrl+Alt+Delete and reboot it
> > normally.
> >
> > 5.5 is OK. 5.6 is broken.
> 
> I've heard some issues relating to missing firmware lately. It should
> work fine without firmware, but perhaps that got broken. Can you log
> into the machine and check dmesg to see what's there? My guess is that
> nouveau takes over from efifb, and then fails to load at some point in
> the middle.

I've fixed the issue by including all firmware until "failed to load"
messages disappeared. X works and fbconsole on VT1-VT6 works too.

CONFIG_EXTRA_FIRMWARE="nvidia/gp104/gr/sw_nonctx.bin nvidia/gp104/gr/sw_ctx.bin nvidia/gp104/gr/sw_bundle_init.bin nvidia/gp104/gr/sw_method_init.bin nvidia/gp104/gr/fecs_bl.bin nvidia/gp104/gr/fecs_inst.bin nvidia/gp104/gr/fecs_data.bin nvidia/gp104/gr/fecs_sig.bin nvidia/gp104/gr/gpccs_bl.bin nvidia/gp104/gr/gpccs_inst.bin nvidia/gp104/gr/gpccs_data.bin nvidia/gp104/gr/gpccs_sig.bin nvidia/gp104/sec2/image.bin nvidia/gp104/sec2/desc.bin nvidia/gp104/sec2/sig.bin nvidia/gp104/acr/ucode_load.bin nvidia/gp104/acr/ucode_unload.bin nvidia/gp104/acr/bl.bin nvidia/gp104/acr/unload_bl.bin nvidia/gp104/nvdec/scrubber.bin"

> > Bisecting is kinda painful with miscompilation and init/main.c breakage.
> >
> > BTW do I need all those megabytes of firmware?
> >
> > [    0.923273] fb0: switching to nouveaufb from EFI VGA
> > [    0.923440] nouveau 0000:02:00.0: NVIDIA GP104 (134000a1)
> > [    1.026681] nouveau 0000:02:00.0: bios: version 86.04.1e.00.01
> > [    1.026930] nouveau 0000:02:00.0: gr: failed to load firmware "gr/sw_nonctx"
> > [    1.026934] nouveau 0000:02:00.0: gr: failed to load gr/sw_nonctx
> 
> This is necessary to provide any sort of acceleration. Otherwise this
> is just a dumb scanout engine. You only need the firmware for your
> chipset, not all of it.

OK, thanks!
_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
