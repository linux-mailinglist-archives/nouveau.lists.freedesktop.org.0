Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F0336E4E3E
	for <lists+nouveau@lfdr.de>; Mon, 17 Apr 2023 18:25:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 943B310E479;
	Mon, 17 Apr 2023 16:25:32 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 25F6310E46F
 for <nouveau@lists.freedesktop.org>; Mon, 17 Apr 2023 16:25:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1681748729;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xTTtRzBVTjjwCLzyfJV4ohTaunXWOeVeAb2RjGQ5vZ8=;
 b=ZwsKl/5UUOyYlSorUGUChmq8A6rrpghmc98BzeGhATVFyE0KEkKuAZGLrAfQF0dFx4S6Ct
 L+t24zDOJ+1t1RAG0o3v7FWuOeDp9PgnY3VewvgxhHYJxTKlCO/UDwoE4c+QnyX3JdIxgC
 R3/ikYSBE2+gMlBtU5SbSPDHcOObwOQ=
Received: from mail-lf1-f70.google.com (mail-lf1-f70.google.com
 [209.85.167.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-650-HlJw-pvXPKuLqeySiGqWYA-1; Mon, 17 Apr 2023 12:25:28 -0400
X-MC-Unique: HlJw-pvXPKuLqeySiGqWYA-1
Received: by mail-lf1-f70.google.com with SMTP id
 2adb3069b0e04-4ec8149ff85so583293e87.1
 for <nouveau@lists.freedesktop.org>; Mon, 17 Apr 2023 09:25:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681748725; x=1684340725;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xTTtRzBVTjjwCLzyfJV4ohTaunXWOeVeAb2RjGQ5vZ8=;
 b=gYExHyOYX6ERqTtUkClZc+i/Dq8pIQ1EQv2m6SRDXHo4pScktYWFyVX8JTtJcLIf1U
 +VDcymVYcQ2p1vc2mJdaIBwp+C4pGabFtx9GIRY1rSKv/lkGoQ/TpBbyXTsjgvmgKJ9p
 KgS/0enLn/fnMGFSsEfUL0qBNi8YACGqfY3gOQTEt984zFOcuapozkq9+bnyDm9gWwct
 mgUHseRl5YKwgYgNDbp/+7ICTfgQp4ROvqyHsyuuo0+0R6SzO5T3TFFgLCxgZBF796nY
 iDvzTb3D+GJnI2sem3lSyzwjpk4Gp0yUjd4tDhM0jAhewOCJXjJlcOi3OLT274vnGN8z
 zuSw==
X-Gm-Message-State: AAQBX9cSS+gDQghe4FVWi807NAsSAqo1ZmNKq+b3CT5nI5ZHQVvluUcU
 SUmmXxg08CKzPmDKm1Q/uoSHpZFPBgjf/6u2J025p9z7IP4nr+XIJK9cwCiEx0oitKxFZ1QjXvb
 tx3IetZ9zRv1CUTBdpvy8jwV06MkTVu7Rn4IttKHgog==
X-Received: by 2002:ac2:5dea:0:b0:4ec:e32f:3d1f with SMTP id
 z10-20020ac25dea000000b004ece32f3d1fmr2308538lfq.11.1681748725393; 
 Mon, 17 Apr 2023 09:25:25 -0700 (PDT)
X-Google-Smtp-Source: AKy350Y+bsYZfdQ0YbXRNUdAiXrEC617Co8M6Ae9OYtGyQ7Z0JTehg+Oxteoxe+dPaIDFHLfU5sWj8/W0mxSAgomtgA=
X-Received: by 2002:ac2:5dea:0:b0:4ec:e32f:3d1f with SMTP id
 z10-20020ac25dea000000b004ece32f3d1fmr2308529lfq.11.1681748725093; Mon, 17
 Apr 2023 09:25:25 -0700 (PDT)
MIME-Version: 1.0
References: <40c60719-4bfe-b1a4-ead7-724b84637f55@web.de>
 <1a11455f-ab57-dce0-1677-6beb8492a257@web.de>
 <2a746461-844a-2ad6-7b52-03f13fe1b9bf@web.de>
In-Reply-To: <2a746461-844a-2ad6-7b52-03f13fe1b9bf@web.de>
From: Karol Herbst <kherbst@redhat.com>
Date: Mon, 17 Apr 2023 18:25:13 +0200
Message-ID: <CACO55ttSoyhgjqMdtiEfhMP1YKFFTZJRXEv17F-WRWPzLF2Uvw@mail.gmail.com>
To: Markus Elfring <Markus.Elfring@web.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Subject: Re: [Nouveau] [PATCH 0/9] GPU-DRM-nouveau: Adjustments for seven
 function implementations
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
Cc: nouveau@lists.freedesktop.org, kernel-janitors@vger.kernel.org,
 LKML <linux-kernel@vger.kernel.org>, dri-devel@lists.freedesktop.org,
 Ben Skeggs <bskeggs@redhat.com>, Daniel Vetter <daniel@ffwll.ch>,
 cocci@inria.fr
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On Sun, Apr 16, 2023 at 11:30=E2=80=AFAM Markus Elfring <Markus.Elfring@web=
.de> wrote:
>
> Date: Sun, 16 Apr 2023 11:22:23 +0200
>
> Several update suggestions were taken into account
> from static source code analysis.
>

Reviewed-by: Karol Herbst <kherbst@redhat.com>

> Markus Elfring (9):
>   debugfs: Move an expression into a function call parameter
>     in nouveau_debugfs_pstate_set()
>   debugfs: Move a variable assignment behind a null pointer check
>     in nouveau_debugfs_pstate_get()
>   debugfs: Use seq_putc()
>     in nouveau_debugfs_pstate_get()
>   debugfs: Replace five seq_printf() calls by seq_puts()
>     in nouveau_debugfs_pstate_get()
>   power_budget: Move an expression into a macro call parameter
>     in nvbios_power_budget_header()
>   clk: Move a variable assignment behind a null pointer check
>     in nvkm_pstate_new()
>   pci: Move a variable assignment behind condition checks
>     in nvkm_pcie_set_link()
>   pci: Move an expression into a function call parameter
>     in nvkm_pcie_set_link()
>   therm: Move an assignment statement behind a null pointer check
>     in two functions
>
>  drivers/gpu/drm/nouveau/nouveau_debugfs.c     | 19 ++++++++++---------
>  .../nouveau/nvkm/subdev/bios/power_budget.c   |  3 +--
>  .../gpu/drm/nouveau/nvkm/subdev/clk/base.c    |  2 +-
>  .../gpu/drm/nouveau/nvkm/subdev/pci/pcie.c    |  7 +++----
>  .../drm/nouveau/nvkm/subdev/therm/fanpwm.c    |  2 +-
>  .../drm/nouveau/nvkm/subdev/therm/fantog.c    |  2 +-
>  6 files changed, 17 insertions(+), 18 deletions(-)
>
> --
> 2.40.0
>

