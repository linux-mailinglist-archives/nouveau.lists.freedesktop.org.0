Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FFBCB0C070
	for <lists+nouveau@lfdr.de>; Mon, 21 Jul 2025 11:37:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 31BB310E045;
	Mon, 21 Jul 2025 09:37:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="B87JHCYd";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC73310E045
 for <nouveau@lists.freedesktop.org>; Mon, 21 Jul 2025 09:37:37 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 9FF65A52865;
 Mon, 21 Jul 2025 09:37:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6D46FC4CEED;
 Mon, 21 Jul 2025 09:37:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1753090656;
 bh=iUU5wLUbnEp0gKzJbH2a5p+9t0cKoHVhfbCFOTJwhXE=;
 h=Date:From:Subject:Cc:To:References:In-Reply-To:From;
 b=B87JHCYd4wE76owDybydC8F+GNtD2/fp7TcrHXgU/dyko4EXp/GP84/Udt5FKgroS
 LkKx44431wQN5x34puN8nCRfV+KnmKdBOGmj6oOSR/SUsFHO57R67Bg9wMg0N6iidX
 cqrMcmUznstAR5kc+2cfnCc/Cc8wv9qFqNSovmohrvZoXSvpP0FHjxjpfwacTsTtqZ
 xL97xJdyRzRBiAmtmmsYNTaq27MpTOJe/y5KF1++LsGLJ8jiliX47srXIun5T7GpNn
 ZHNEkzt/fUFKLQWzNw+mP44GUrOzFtCZ594kAT6VQ96aOonh3hNXiQmKGbAMm9lA6e
 F2dn/s7/9qzcA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 21 Jul 2025 11:37:33 +0200
Message-Id: <DBHMRS56L6EH.3I70KCPJ55QJC@kernel.org>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH] drm/nouveau/nvif: fix null ptr deref on pre-fermi boards
Cc: <nouveau@lists.freedesktop.org>, "Jamie Heilman"
 <jamie@audible.transient.net>, "Rui Salvaterra" <rsalvaterra@gmail.com>
To: "Ben Skeggs" <bskeggs@nvidia.com>
References: <20250714025923.29591-1-bskeggs@nvidia.com>
In-Reply-To: <20250714025923.29591-1-bskeggs@nvidia.com>
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

On Mon Jul 14, 2025 at 4:59 AM CEST, Ben Skeggs wrote:
> Check that gpfifo.post() exists before trying to call it.
>
> Fixes: 862450a85b85 ("drm/nouveau/gf100-: track chan progress with non-WF=
I semaphore release")
> Reported-by: Jamie Heilman <jamie@audible.transient.net>
> Reported-by: Rui Salvaterra <rsalvaterra@gmail.com>
> Tested-by: Rui Salvaterra <rsalvaterra@gmail.com>
> Signed-off-by: Ben Skeggs <bskeggs@nvidia.com>

Please remember to add a Closes tag for Reported-by (I added them when I ap=
plied
the patch).

Applied to drm-misc-fixes, thanks!
