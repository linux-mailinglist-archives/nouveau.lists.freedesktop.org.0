Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D643EB0234C
	for <lists+nouveau@lfdr.de>; Fri, 11 Jul 2025 20:03:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 731C110E2D2;
	Fri, 11 Jul 2025 18:03:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="dSLqWkxc";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 35C8310E2D2
 for <nouveau@lists.freedesktop.org>; Fri, 11 Jul 2025 18:03:47 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 664C661438;
 Fri, 11 Jul 2025 18:03:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6D517C4CEED;
 Fri, 11 Jul 2025 18:03:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1752257026;
 bh=ZkrKoyAVIz40/7Y5/MncnPuno3pbTAV1np82fq7nNio=;
 h=Date:From:Subject:Cc:To:References:In-Reply-To:From;
 b=dSLqWkxc/P8oL/GXGSBsfl6gBXXt0lfc9U1UaRIuY4MoAQ7TbTv7PTauzvGOaAJME
 2J91tUWwc3dxJTEGbNKgK+wzaepneLUDFvzQ/UkLHP1OFT3KGyV8tNQ8HMap6aKjJN
 RZpGdumwuDbMk78+oZuiSXWaaZCkhxXOl56Rpb3db5Ys8mc2fqUCwwNPNy/qFg0Ttm
 RayyMXdYZfDHo9hXT8iklOt7CmNE96/9OZ5FVCn2TZK1MDmdvCkPFgoLVYcnuNxXrG
 HAiZC5CloJIwG1asvYd3AVeUMi7jWlapj9whIOj6/eU6ZnFU6UtaMv3pCGp3h5Pw2P
 GUSV6ft4SOzbg==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 11 Jul 2025 20:03:43 +0200
Message-Id: <DB9F9VX833TY.1UG2ZE2K2ZGNQ@kernel.org>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH] gpu: nova-core: fix bounds check In
 PmuLookupTableEntry::new, data is sliced from 2..6, but the bounds check
 data.len() < 5 does not satisfy those bounds.
Cc: <nouveau@lists.freedesktop.org>, <acourbot@nvidia.com>
To: "Quaternions" <krakow20@gmail.com>
References: <20250711093015.28785-1-krakow20@gmail.com>
In-Reply-To: <20250711093015.28785-1-krakow20@gmail.com>
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

Hi Rhys,

On Fri Jul 11, 2025 at 11:30 AM CEST, Quaternions wrote:
> Signed-off-by: Rhys Lloyd <krakow20@gmail.com>

Thanks for your contribution.

When sending patches, please make sure to follow the kernel's patch submiss=
ion
guidelines [1].

In particular, please stick to short and meaningful commit subject, followe=
d by
a commit description, even if the patch is simple and obvious.

Also make sure to run ./scripts/checkpatch.pl and ./scripts/get_maintainer.=
pl to
get your patches checked and find the correct list of people to send them t=
o.

Finally, please also consider the Rust submit checklist [2].

Thanks,
Danilo

[1] https://docs.kernel.org/process/submitting-patches.html
[2] https://rust-for-linux.com/contributing#submit-checklist-addendum
