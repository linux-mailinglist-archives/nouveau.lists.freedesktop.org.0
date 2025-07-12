Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DF63AB02AEA
	for <lists+nouveau@lfdr.de>; Sat, 12 Jul 2025 15:11:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DEA2610E02B;
	Sat, 12 Jul 2025 13:11:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="AdOw9usO";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 412FE10E02B
 for <nouveau@lists.freedesktop.org>; Sat, 12 Jul 2025 13:11:33 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id DA209A54BA7;
 Sat, 12 Jul 2025 13:11:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 87EE1C4CEEF;
 Sat, 12 Jul 2025 13:11:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1752325891;
 bh=BBo/M80dahd5Oiw3ZWnLkUh/N4K3vOWKJzh7Vz5cAfc=;
 h=Date:Cc:To:From:Subject:References:In-Reply-To:From;
 b=AdOw9usOZGB8sIhzhihXnUqLjI4YinlY10s777FTPmi3B6Mmogein/J2lI5Q1BW0E
 YLsDhjzWcrJeLAEPlcMh2givDrsdsepOOHoVh3JqQpxDhv7xNnhlLkKzrhZZUChhLG
 rvyzQVkfVr8WYnbeppGVlkX6pAcWdv0M4r5LL3nzGYB7RhqhPF3H6/OPbKzqC/BSw7
 TrXXz1vOf9klRSgXLy8Vl12AD0fS0m/67EsekgRI1dNlnOADpiuwPywcDb627y3wcM
 1kXBCljoCSA86rrJ7m9z/D8x6n6JpJmOpn2CkItEo6xcjCKfqnCSCpgisSopY0qQ0A
 IUJHJb+MD/CVg==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 12 Jul 2025 15:11:28 +0200
Message-Id: <DBA3OO3OW5OY.22LZ62YE4YA2B@kernel.org>
Cc: <nouveau@lists.freedesktop.org>, <acourbot@nvidia.com>
To: "Rhys Lloyd" <krakow20@gmail.com>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH] gpu: nova-core: fix bounds check In
 PmuLookupTableEntry::new, data is sliced from 2..6, but the bounds check
 data.len() < 5 does not satisfy those bounds.
References: <20250711093015.28785-1-krakow20@gmail.com>
 <DB9F9VX833TY.1UG2ZE2K2ZGNQ@kernel.org>
 <CAH7AjUyHZnf96D5wSeX6pi-YmqrqhY1HGymvkugFeU7-ne4MfA@mail.gmail.com>
In-Reply-To: <CAH7AjUyHZnf96D5wSeX6pi-YmqrqhY1HGymvkugFeU7-ne4MfA@mail.gmail.com>
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

On Sat Jul 12, 2025 at 3:30 AM CEST, Rhys Lloyd wrote:
> Hi Danilo,
> I didn't understand the maintainers list yesterday, so all the patches
> I sent are missing mailing lists and recipients.  I sent a second copy
> as requested in
> https://gitlab.freedesktop.org/drm/nova/-/merge_requests/4#note_3003142,
> and my mailing list mistakes were pointed out in detail.  I also sent
> a fixed up v2 to the rust-for-linux mailing list only.  If I need to
> send out another copy let me know, thanks.

Can you please send a v2 following the instructions I linked in my previous
reply?

For your patch, scripts/get_maintainer.pl should give you

	Danilo Krummrich <dakr@kernel.org> (maintainer:CORE DRIVER FOR NVIDIA GPUS=
 [RUST])
	Alexandre Courbot <acourbot@nvidia.com> (maintainer:CORE DRIVER FOR NVIDIA=
 GPUS [RUST])
	David Airlie <airlied@gmail.com> (maintainer:DRM DRIVERS)
	Simona Vetter <simona@ffwll.ch> (maintainer:DRM DRIVERS)
	nouveau@lists.freedesktop.org (open list:CORE DRIVER FOR NVIDIA GPUS [RUST=
])
	dri-devel@lists.freedesktop.org (open list:DRM DRIVERS)
	linux-kernel@vger.kernel.org (open list)

Additionally, it makes sense to also add rust-for-linux@vger.kernel.org.

- Danilo
