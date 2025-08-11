Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D024B21877
	for <lists+nouveau@lfdr.de>; Tue, 12 Aug 2025 00:34:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 567B010E15A;
	Mon, 11 Aug 2025 22:34:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="ocrV428F";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F333E10E15A
 for <nouveau@lists.freedesktop.org>; Mon, 11 Aug 2025 22:34:09 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 2824D601FE;
 Mon, 11 Aug 2025 22:34:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EB63DC4CEF6;
 Mon, 11 Aug 2025 22:34:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1754951648;
 bh=SsqKG45/ct+KZq0Ksf2Tucs4kx1XZUQ48I5opCsC4k8=;
 h=Date:Subject:To:References:From:Cc:In-Reply-To:From;
 b=ocrV428FvVN8aAw1kuqu/B1mjh/56T0oRZjzsAhssiXMCgh3YX9/KbUgfyDTl9YWl
 OHejdVQZy72Tyf+0s2Dizd8lKsEXhxXwMJQSlMP3m1sFOwnbv+znhREhk31B3aZQvP
 6dWAjxw4Xic2jgb4E2bhPq3nGuZydnEM0SKi16sPozbAzjq8c3mVYDSqBrbdPCxALO
 AGc8u+RpsRvat3f6X1SUkoe49GKPhBXTugMeue2gDb9oBvD7D8YnykMCIPBEToHcuP
 PVk0oJhB5NWr3JOErBxF+cmQuGcmR8c1IiVsiDb6DJQ5e7okhfT3Fej2D7HIOCaMxs
 3Mv0soJgf+3rQ==
Message-ID: <c34ccc23-5550-4f26-af66-47979afd197e@kernel.org>
Date: Tue, 12 Aug 2025 00:34:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/nouveau: always set RMDevidCheckIgnore for GSP-RM
To: Timur Tabi <ttabi@nvidia.com>
References: <20250808191340.1701983-1-ttabi@nvidia.com>
From: Danilo Krummrich <dakr@kernel.org>
Cc: Lyude Paul <lyude@redhat.com>, nouveau@lists.freedesktop.org
Content-Language: en-US
In-Reply-To: <20250808191340.1701983-1-ttabi@nvidia.com>
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

On 8/8/25 9:13 PM, Timur Tabi wrote:
> Always set the RMDevidCheckIgnore registry key for GSP-RM so that it
> will continue support newer variants of already supported GPUs.

Applied to drm-misc-next, thanks!
