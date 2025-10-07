Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F68BBC29C0
	for <lists+nouveau@lfdr.de>; Tue, 07 Oct 2025 22:17:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B4FEF10E37F;
	Tue,  7 Oct 2025 20:17:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="UscjKB4K";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A467110E13B;
 Tue,  7 Oct 2025 20:17:40 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id B8855603A4;
 Tue,  7 Oct 2025 20:17:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 62F7FC4CEF1;
 Tue,  7 Oct 2025 20:17:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1759868259;
 bh=eAj9fTABA6mwf3gt4JhMjxYOGvFdQBfl/haKLAH7FDo=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=UscjKB4KmibsVQTi3mswoi/J1Hb30clNJUvZ+FmjyHearI6UTVMVIv+rhV86hYYeH
 QB5OYukWKuh/fb0jrFQXu8uauw9BjYZPC6oy16x86qz23vJSG1amT5CfSwDHb4M8f6
 wBry8M8zr+rptB58GTK90FQNsRiNMbTvtZG/691UvX85wBgIlSQ7QPv3K0J1vp7Nqb
 lNUUfc5+iJ0luO32Pk9tTVIBFAwFXv+g9nNuMYIJtLTyR8/UWrqMNcRWLzK5TQ7otv
 NynWW2vt8L5c4wIDbjmEwoZYxYB55sI164Rbj6bu8hQvyPUczLqcGdn7rhK+dbH9Xp
 zAutX2mRePoOw==
Message-ID: <56e7c42f-468c-4855-9039-bf81e51c158f@kernel.org>
Date: Tue, 7 Oct 2025 22:17:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/nouveau: fix bad ret code in nouveau_bo_move_prep
To: Shuhao Fu <sfual@cse.ust.hk>
Cc: Lyude Paul <lyude@redhat.com>, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <aOU9BXjYDNoPRQmf@homelab>
From: Danilo Krummrich <dakr@kernel.org>
Content-Language: en-US
In-Reply-To: <aOU9BXjYDNoPRQmf@homelab>
Content-Type: text/plain; charset=UTF-8
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

On 10/7/25 6:17 PM, Shuhao Fu wrote:
> In `nouveau_bo_move_prep`, if `nouveau_mem_map` fails, an error code
> should be returned. Currently, it returns zero even if vmm addr is not
> correctly mapped.
> 
> Signed-off-by: Shuhao Fu <sfual@cse.ust.hk>
> Fixes: 9ce523cc3bf2 ("drm/nouveau: separate buffer object backing memory from nvkm structures")
Applied to drm-misc-fixes, thanks!
