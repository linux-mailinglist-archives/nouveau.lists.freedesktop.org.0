Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B04867FA8C
	for <lists+nouveau@lfdr.de>; Sat, 28 Jan 2023 20:49:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D9D210E05E;
	Sat, 28 Jan 2023 19:49:44 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [IPv6:2a00:1450:4864:20::531])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D98F10E05E
 for <nouveau@lists.freedesktop.org>; Sat, 28 Jan 2023 19:49:41 +0000 (UTC)
Received: by mail-ed1-x531.google.com with SMTP id n6so4926100edo.9
 for <nouveau@lists.freedesktop.org>; Sat, 28 Jan 2023 11:49:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
 :reply-to; bh=sO7UFPAZ5ipITcECO24P9uQ1IShk8QTj6My2HieSQws=;
 b=jzNVGVvTE2HFKVLCwGxGV1dUHlVW8dNZgwyoIV9lHAH+2iLiAYLDSh+EoLMuYfd/Kq
 T21cf2WfHBFlsn0twy6N/xRHUhE0IuItx9yPTe8n12qoTogyJNItLKXiCKfBdTMFAeYm
 WRErPYPzETrojUHHGV0t3MpnI1YzI7sroDzl0qiV5P5ofgLso57SWFPBRp6ArVpejOvA
 hTcXsTyzsm8tBw6CtwYzdRNHVzqONhPJS1+nohjz8GbRMdkaU/yY7Uxt6w83au7wIHYS
 V9+EnhDzzevExl9Wu9vXJoDsiGr0bKKxlEszeZ40lZ49Lyw72RjVk+TFB3leXe0uaJbn
 Oy4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=sO7UFPAZ5ipITcECO24P9uQ1IShk8QTj6My2HieSQws=;
 b=RHxak6RO0Xgj5XYxrsmjjc15b0mtbZ8GpD2EZGJy5brT3zOcbnlkiFRIDsGwWgPDw0
 xDLhvay4e2OCl9ybvoTkBVy/bMXekLTyq+CHq6pRmQCONfHLVZUVQ97pAlSUdhGj9HCg
 ed1R7daFIV2dTGIB8NdbU+1aQ1RB+Wl003DfLVPnnhfuvSpxSG0FKfm9nnX+hM0ADdeW
 TcoqDR8kbzRMWnliPMi+9qHxqI5CRsIhm4+QT9by1DBYB3HC44BNqu3satTTCWYGhFVP
 0Addz/UqQQch7IjYCm0O67G1HX42jGjf/B7YDmkM6x2B8NL/CFVfHKiUn6QUBKMAdvxl
 TM8w==
X-Gm-Message-State: AFqh2kpvj1bdumpHzTni5KBrIURnlRSH+YhV8cj/5uuPYq7siMEONmyV
 W9nVp3HyWUHswGRW/D9EMDw=
X-Google-Smtp-Source: AMrXdXtAcT3gd3LmQFK4oXM1qMxTHcdxecJwUH68lFyOEcOfZg75/8qWSlJJB7LZsJr7ngQJx9uH3A==
X-Received: by 2002:a05:6402:294c:b0:48e:c0c3:7974 with SMTP id
 ed12-20020a056402294c00b0048ec0c37974mr50319656edb.12.1674935380045; 
 Sat, 28 Jan 2023 11:49:40 -0800 (PST)
Received: from eldamar.lan (c-82-192-242-114.customer.ggaweb.ch.
 [82.192.242.114]) by smtp.gmail.com with ESMTPSA id
 g5-20020a50ee05000000b004835bd8dfe5sm4334889eds.35.2023.01.28.11.49.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 28 Jan 2023 11:49:39 -0800 (PST)
Received: by eldamar.lan (Postfix, from userid 1000)
 id AB9F6BE2DE0; Sat, 28 Jan 2023 20:49:38 +0100 (CET)
Date: Sat, 28 Jan 2023 20:49:38 +0100
From: Salvatore Bonaccorso <carnil@debian.org>
To: Greg KH <gregkh@linuxfoundation.org>
Message-ID: <Y9V8UoUHm3rHcDkc@eldamar.lan>
References: <20220819200928.401416-1-kherbst@redhat.com>
 <CAHSpYy0HAifr4f+z64h+xFUmMNbB4hCR1r2Z==TsB4WaHatQqg@mail.gmail.com>
 <CACO55tv0jO2TmuWcwFiAUQB-__DZVwhv7WNN9MfgMXV053gknw@mail.gmail.com>
 <CAHSpYy117N0A1QJKVNmFNii3iL9mU71_RusiUo5ZAMcJZciM-g@mail.gmail.com>
 <cdfc26b5-c045-5f93-b553-942618f0983a@gmail.com>
 <Y9VgjLneuqkl+Y87@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y9VgjLneuqkl+Y87@kroah.com>
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
 Ben Skeggs <bskeggs@redhat.com>
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

Hi Greg,

I'm not the reporter, so would like to confirm him explicitly, but I
believe I can give some context:

On Sat, Jan 28, 2023 at 06:51:08PM +0100, Greg KH wrote:
> On Sat, Jan 28, 2023 at 03:49:59PM +0100, Computer Enthusiastic wrote:
> > Hello,
> > 
> > The patch "[Nouveau] [PATCH] nouveau: explicitly wait on the fence in
> > nouveau_bo_move_m2mf" [1] was marked for kernels v5.15+ and it was merged
> > upstream.
> > 
> > The same patch [1] works with kernel 5.10.y, but it is not been merged
> > upstream so far.
> > 
> > According to Karol Herbst suggestion [2], I'm sending this message to ask
> > for merging it into 5.10 kernel.
> 
> We need to know the git commit id.  And have you tested it on 5.10.y?
> And why are you stuck on 5.10.y for this type of hardware?  Why not move
> to 5.15.y or 6.1.y?

This would be commit 6b04ce966a73 ("nouveau: explicitly wait on the
fence in nouveau_bo_move_m2mf") in mainline, applied in 6.0-rc3 and
backported to 5.19.6 and 5.15.64.

Computer Enthusiastic, tested it on 5.10.y: 
https://lore.kernel.org/nouveau/CAHSpYy1mcTns0JS6eivjK82CZ9_ajSwH-H7gtDwCkNyfvihaAw@mail.gmail.com/

It was reported in Debian by the user originally as
https://bugs.debian.org/989705#69 after updating to the 5.10.y series in Debian
bullseye.

I guess the user could move to the next stable release Debian bookworm, once
it's released (it's currently in the last milestones to finalize, cf.
https://release.debian.org/ but we are not yet there). In the next release this
will be automatically be fixed indeed.

Computer Enthusiastic, can you confirm please to Greg in particular the first
questions, in particular to confirm the commit fixes the suspend issue?

Regards,
Salvatore
