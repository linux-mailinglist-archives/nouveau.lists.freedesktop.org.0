Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 21495B1F483
	for <lists+nouveau@lfdr.de>; Sat,  9 Aug 2025 14:00:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C907E10E1AE;
	Sat,  9 Aug 2025 12:00:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="YhxG4HX6";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC64610E1AE;
 Sat,  9 Aug 2025 12:00:42 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 172A3601E0;
 Sat,  9 Aug 2025 12:00:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D750BC4CEE7;
 Sat,  9 Aug 2025 12:00:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1754740841;
 bh=b1HvrEb561Jsz2wV3a/DN0hWDTp3a+adcs+a8JqHV8A=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=YhxG4HX6Uc0gYbFCOogW/OLTazlNMsMjO1eVi1aWGNq9ClErv2YgSwOMP/lIAiXKg
 1/MQVQVPsfHoez7UX2kWbs+pMHCJcBan/bAovoXjjMewbippBv3CwIaKGDdf9fgefS
 yfI3zAPJ8L5bmjzrsroM4HvZW5Jiy1LJ7GQwRrbomjn8CMVyHlBL5wdH3YRTqAvF0/
 7MIQ/UduVFqEznGXLKaqM3MHmddxq+yfNyssUvD5D4SNRxBDsBMGLGpHWQ02f58KNa
 zY4JgB1aaaLtLasXxnV/MhfuBi+rHfOt0njB51KL5quqlTyqVQ2gmi4MQwDUH3E5Kc
 Ubfj1bhUyFtBw==
Message-ID: <409c30fa-5f82-4da5-95f1-765399b16add@kernel.org>
Date: Sat, 9 Aug 2025 14:00:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/nouveau: Remove surplus struct member
To: Philipp Stanner <phasta@kernel.org>
Cc: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20250801074531.79237-2-phasta@kernel.org>
From: Danilo Krummrich <dakr@kernel.org>
Content-Language: en-US
In-Reply-To: <20250801074531.79237-2-phasta@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
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

On 8/1/25 9:45 AM, Philipp Stanner wrote:
> struct nouveau_channel contains the member 'accel_done' and a forgotten
> TODO which hints at that mechanism being removed in the "near future".
> Since that variable is read nowhere anymore, this "near future" is now.
> 
> Remove the variable and the TODO.
> 
> Signed-off-by: Philipp Stanner <phasta@kernel.org>

Applied to drm-misc-next, thanks!
