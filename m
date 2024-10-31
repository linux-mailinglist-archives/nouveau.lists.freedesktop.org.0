Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 91CB79B9291
	for <lists+nouveau@lfdr.de>; Fri,  1 Nov 2024 14:52:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4608A10E9C9;
	Fri,  1 Nov 2024 13:52:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="JV7T24fb";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C64A510E9C9
 for <nouveau@lists.freedesktop.org>; Fri,  1 Nov 2024 13:52:09 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id C03375C90AF;
 Thu, 31 Oct 2024 09:05:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E7423C4CEC3;
 Thu, 31 Oct 2024 09:05:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1730365551;
 bh=UKXW3/4EmfxDoKhp7ewD4Y5Yg9pheLXaBZxwalAV/TI=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=JV7T24fbFDtXcj2uR7YjzV1rDbyahACTW6ch1BYC5nMo9UlYxJC0EUKRX8as0nEh8
 NmgovKS2YL3C5FIf+8am8hGe7YEu+Muo/+W72C+mH5iDUkuuKFqfNSyU65KZ0xnd4h
 9r05W2EVSbuwB+69Dfg3RNn5xBQZtVVjTkCO2H4px//CpjhrZEyGflIBhRDBIGURQh
 QILWjhGUMzYjbX9zVAMDI4ijYwyI2oJgv5l+1TEE0tq3S499dcfd2xlAktD/XJulPq
 oXYx2HKEDfVs/X0xmGs+UxXfPpcci1DL7dZ3HAyHUHMW5JjZKK/VLSxJdmcBJwnvvz
 GJVlRZa/pVUvQ==
Message-ID: <44db9a6e-41d3-4e78-996e-c4e9aff8ae95@kernel.org>
Date: Thu, 31 Oct 2024 10:05:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 00/15] NVKM GSP RPC kernel docs, cleanups and fixes
To: Zhi Wang <zhiw@nvidia.com>
Cc: nouveau@lists.freedesktop.org, airlied@gmail.com, daniel@ffwll.ch,
 bskeggs@nvidia.com, acurrid@nvidia.com, cjia@nvidia.com, smitra@nvidia.com,
 ankita@nvidia.com, aniketa@nvidia.com, kwankhede@nvidia.com,
 targupta@nvidia.com, zhiwang@kernel.org
References: <20241031085250.2941482-1-zhiw@nvidia.com>
From: Danilo Krummrich <dakr@kernel.org>
Content-Language: en-US
In-Reply-To: <20241031085250.2941482-1-zhiw@nvidia.com>
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

Hi Zhi,

On 10/31/24 9:52 AM, Zhi Wang wrote:
> Hi folks:
> 
> Here is the leftover of the previous spin of NVKM GSP RPC fixes, which
> is handling the return of large GSP message. PATCH 1 and 2 in the previous
> spin were merged [1], and this spin is based on top of PATCH 1 and PATCH 2
> in the previous spin.
> 
> Besides the support of the large GSP message, kernel doc and many cleanups
> are introduced according to the comments in the previous spin [2].

Thanks for this work! I'll go through the patches in the next days.

- Danilo
