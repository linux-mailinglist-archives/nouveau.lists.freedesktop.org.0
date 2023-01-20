Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A8656F6B5F
	for <lists+nouveau@lfdr.de>; Thu,  4 May 2023 14:32:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D83110E3FA;
	Thu,  4 May 2023 12:31:45 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from smtp1.tecnico.ulisboa.pt (smtp1.tecnico.ulisboa.pt
 [193.136.128.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3482010EA36;
 Fri, 20 Jan 2023 11:37:22 +0000 (UTC)
Received: from localhost (localhost.localdomain [127.0.0.1])
 by smtp1.tecnico.ulisboa.pt (Postfix) with ESMTP id 769D26008831;
 Fri, 20 Jan 2023 11:37:20 +0000 (WET)
X-Virus-Scanned: by amavisd-new-2.11.0 (20160426) (Debian) at
 tecnico.ulisboa.pt
Received: from smtp1.tecnico.ulisboa.pt ([127.0.0.1])
 by localhost (smtp1.tecnico.ulisboa.pt [127.0.0.1]) (amavisd-new, port 10025)
 with LMTP id ycM_b9OLVerz; Fri, 20 Jan 2023 11:37:18 +0000 (WET)
Received: from mail1.tecnico.ulisboa.pt (mail1.ist.utl.pt [193.136.128.10])
 by smtp1.tecnico.ulisboa.pt (Postfix) with ESMTPS id C98626008828;
 Fri, 20 Jan 2023 11:37:17 +0000 (WET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=tecnico.ulisboa.pt;
 s=mail; t=1674214638;
 bh=Xceh/ltBYNbtbQTxGHxOIwMD72Lbmf8kpmBAZEASpkE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To;
 b=JdyXvczcQUGMYfdwQuGfdfmR0IQNaf9xCiY1/23qDPJ7xLEsyMrqH6u3MIJg/IeiA
 YxzvXehwCSosD+ViCsPFh1yxnEW3kXfxrfWzgibHKiUAYa7B0gstWThkQ1HoYHxhpj
 rflecTJF3he+AV99L3OvDpP5AMdFEExGDSOzz5Tg=
Received: from wslaptop (unknown [IPv6:2001:818:dcb5:dc00:d990:b664:f16:4cb2])
 (Authenticated sender: ist187313)
 by mail1.tecnico.ulisboa.pt (Postfix) with ESMTPSA id 66A0F360079;
 Fri, 20 Jan 2023 11:37:17 +0000 (WET)
Date: Fri, 20 Jan 2023 11:34:43 +0000
From: Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
To: Ben Skeggs <skeggsb@gmail.com>
Message-ID: <20230120113443.wgwhwp7tm6rnc6je@wslaptop>
References: <20221228144914.z7t7a4fdwvbblnak@wslaptop>
 <CAMwc25rY4xpn0yvCScMr6Hk9pFSdvt=9QOypSQDfj1d5tWmtvA@mail.gmail.com>
 <20230116122403.upk5ci4mbebw23m7@wslaptop>
 <CACAvsv48vH6hbacQCN+yKP8ZcDjFMWciBt6U_Xv-LEYJHZ1q9g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACAvsv48vH6hbacQCN+yKP8ZcDjFMWciBt6U_Xv-LEYJHZ1q9g@mail.gmail.com>
X-Mailman-Approved-At: Thu, 04 May 2023 12:31:35 +0000
Subject: Re: [Nouveau] [REGRESSION] GM20B probe fails after commit
 2541626cfb79
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
Cc: regressions@lists.linux.dev, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, bskeggs@redhat.com,
 David Airlie <airlied@redhat.com>
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On Wed, Jan 18, 2023 at 11:28:49AM +1000, Ben Skeggs wrote:
> On Mon, 16 Jan 2023 at 22:27, Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt> wrote:
> > On Mon, Jan 16, 2023 at 07:45:05AM +1000, David Airlie wrote:
> > > As a quick check can you try changing
> > >
> > > drivers/gpu/drm/nouveau/nvkm/core/firmware.c:nvkm_firmware_mem_target
> > > from NVKM_MEM_TARGET_HOST to NVKM_MEM_TARGET_NCOH ?

> In addition to Dave's change, can you try changing the
> nvkm_falcon_load_dmem() call in gm20b_pmu_init() to:
> 
> nvkm_falcon_pio_wr(falcon, (u8 *)&args, 0, 0, DMEM, addr_args,
> sizeof(args), 0, false);

Hello!

Chiming in just to say that with this change I see the same as Nicolas
except that the init message size is 255 instead of 0:

[    2.196934] nouveau 57000000.gpu: pmu: unexpected init message size 255 vs 42
