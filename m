Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CFC37A3273C
	for <lists+nouveau@lfdr.de>; Wed, 12 Feb 2025 14:36:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A2D510E8AB;
	Wed, 12 Feb 2025 13:36:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="WLq0rECc";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B68310E8A4
 for <nouveau@lists.freedesktop.org>; Wed, 12 Feb 2025 13:36:41 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 86C3D5C5E42;
 Wed, 12 Feb 2025 13:36:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 172F0C4CEDF;
 Wed, 12 Feb 2025 13:36:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1739367400;
 bh=O5iU1M1FYTQukH1JNSpnjsdZQkzpnFf23Vyfp5VxOjo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=WLq0rECchffLNb6SEgFbkU6Pr1B7dORs4DAWGxS5NBhd3XkZh+cUhLoETJA2k+RIn
 3eahu7WT4DMZj9pSCspLiRALsTAZr25jrLRbVChmjrxNOCm10rxOrMkv0RB4b+Sy4b
 pJ2blwjJM1HKPZ+zS36gAEjr5fjAq8dFOleL46g7hT8RsNdQ7lLWHkD0PkpRsdu5si
 4lFDgvzWcUVyI0FbwRh764NX7JGj5mOJkBp1/7gONAZXRn9s60ezlCqi4RxaHtkdqW
 tlUgr9aMnTtk2cIiHJx/8sOOaOn50IODI+OqrZ3nsVEYKwOZqu2jstbiTT9zium6tw
 IHgVDTZwxq8wA==
Date: Wed, 12 Feb 2025 14:36:35 +0100
From: Danilo Krummrich <dakr@kernel.org>
To: Zhi Wang <zhiw@nvidia.com>
Cc: nouveau@lists.freedesktop.org, airlied@gmail.com, daniel@ffwll.ch,
 bskeggs@nvidia.com, acurrid@nvidia.com, cjia@nvidia.com,
 smitra@nvidia.com, ankita@nvidia.com, aniketa@nvidia.com,
 kwankhede@nvidia.com, targupta@nvidia.com, zhiwang@kernel.org
Subject: Re: [PATCH 0/5] NVKM GSP RPC message handling policy
Message-ID: <Z6yj4-gh7s372H0v@pollux>
References: <20250207175806.78051-1-zhiw@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250207175806.78051-1-zhiw@nvidia.com>
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

For future submissions, please make sure to also add the other nouveau
maintainers to keep them in the loop.
