Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 92DB7B1F45D
	for <lists+nouveau@lfdr.de>; Sat,  9 Aug 2025 13:28:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A00F10E14E;
	Sat,  9 Aug 2025 11:28:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="tJb3LlHI";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 598CE10E14E
 for <nouveau@lists.freedesktop.org>; Sat,  9 Aug 2025 11:28:11 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 95E89A55592;
 Sat,  9 Aug 2025 11:28:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 95510C4CEE7;
 Sat,  9 Aug 2025 11:28:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1754738890;
 bh=g1UDVbrI1eHEbHExYj+1VQeK7yoT1MfUBpHp9GwSqu0=;
 h=Date:Subject:To:References:From:Cc:In-Reply-To:From;
 b=tJb3LlHI8NZNYdQR/fN4hniTp6YpVRmb81Nh2u9RSN6pdUQ+/DPWQWLc9piX1koLH
 m3fGSXeOAQq24j5zK8XmsB3F2E3v+TNCZ0Dq8pQ6JFWgM3+8PhxOeJswQdg1aNUbq3
 MEkhUd7xJN60mrKBUeDBVWdBjEq+fpnJUgqImGrung1lkWXMwHcf9ERIf4fdX6Zn8h
 8Qb0A4PxMLnZGc6rrFVcW9OoWTNaYMHALdvjIN9iRUA+UbtbHu6o3ucS6pRKpYvrbA
 6pcO5R8sMN7ZQZ+RQEJdC+nrCXl/iG98svJ5BlQs9j+qhyAb2h/0RJa9Q4TMyrZhz7
 nx3wEZ+AeEk5Q==
Message-ID: <05ba6c52-a503-474e-919b-d9621c7b3198@kernel.org>
Date: Sat, 9 Aug 2025 13:28:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/3] Various minor fixes to Nouveau
To: Timur Tabi <ttabi@nvidia.com>
References: <20250804192601.10861-1-ttabi@nvidia.com>
From: Danilo Krummrich <dakr@kernel.org>
Cc: Lyude Paul <lyude@redhat.com>, nouveau@lists.freedesktop.org
Content-Language: en-US
In-Reply-To: <20250804192601.10861-1-ttabi@nvidia.com>
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

On 8/4/25 9:25 PM, Timur Tabi wrote:
> Three minor fixes to Nouveau, discovered while working on Nova.

Thanks for this series!

> Timur Tabi (3):
>    drm/nouveau: fix error path in nvkm_gsp_fwsec_v2
>    drm/nouveau: remove unused increment in gm200_flcn_pio_imem_wr
>    drm/nouveau: remove unused memory target test

Please also add a Fixes tag for the last two patches.
