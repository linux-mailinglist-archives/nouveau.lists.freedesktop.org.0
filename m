Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 74D44A7135F
	for <lists+nouveau@lfdr.de>; Wed, 26 Mar 2025 10:11:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3993C10E67E;
	Wed, 26 Mar 2025 09:11:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="gQRxcRQH";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 81A6F10E10A;
 Wed, 26 Mar 2025 09:11:54 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 1322061141;
 Wed, 26 Mar 2025 09:11:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F039AC4CEE2;
 Wed, 26 Mar 2025 09:11:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1742980313;
 bh=3kCGSkXuBr815QYHQXrTf92q9/vWWBATyeD4yTh8H40=;
 h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
 b=gQRxcRQHG4iHz+9rZomAvSB4djOc01QxRa7S1hCDlMAbip++CpctULgaJgBm5czmE
 VoqoBS0dqEqNxcBhl1AsC/LXoltEnSSVwZfT/n0ll8eUzTIOHHVABXR83AxwmQ07cD
 +eJy0JBpysFewDZ8I9qSABa/k8SPgIAOSxxR9MwSyAtyPNh7clXTBxqnBZw8mXUB3V
 JzmnD01sL+xT7P9VVwb6XR+eGXNTKHu4nSs6U9LHa6AI6J1YYLcvgBOTCuJpaAb8m0
 Ci/Lf3xiYB3sva0XajLYT1rmP/IQZNVqHOx6C123pbAFSKCqn5C7H8Qzke7J39VI6R
 /0xylm/eNjQxw==
Message-ID: <45dcf149f8224b5f13b9b102c706c94b@kernel.org>
Date: Wed, 26 Mar 2025 09:11:50 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH 2/2] drm: nova-drm: add initial driver skeleton
In-Reply-To: <20250325232222.5326-3-dakr@kernel.org>
References: <20250325232222.5326-3-dakr@kernel.org>
Cc: a.hindborg@kernel.org, acurrid@nvidia.com, airlied@gmail.com,
 ajanulgu@redhat.com, alex.gaynor@gmail.com, aliceryhl@google.com,
 benno.lossin@proton.me, bjorn3_gh@protonmail.com, boqun.feng@gmail.com,
 bskeggs@nvidia.com, cjia@nvidia.com, dri-devel@lists.freedesktop.org,
 gary@garyguo.net, jhubbard@nvidia.com, lyude@redhat.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 nouveau@lists.freedesktop.org, ojeda@kernel.org, pstanner@redhat.com,
 rust-for-linux@vger.kernel.org, simona@ffwll.ch, tmgross@umich.edu,
 tzimmermann@suse.de, zhiw@nvidia.com, "Maxime Ripard" <mripard@kernel.org>
Content-Transfer-Encoding: 7bit
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

On Wed, 26 Mar 2025 00:21:49 +0100, Danilo Krummrich wrote:
> Add the initial nova-drm driver skeleton.
> 
> nova-drm is connected to nova-core through the auxiliary bus and
> implements the DRM parts of the nova driver stack.
> 
> 
> [ ... ]

Reviewed-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime
