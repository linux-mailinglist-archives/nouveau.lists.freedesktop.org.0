Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 13623AF8E6E
	for <lists+nouveau@lfdr.de>; Fri,  4 Jul 2025 11:24:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F00210E9BD;
	Fri,  4 Jul 2025 09:24:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="X5ugVTKi";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F22D110E04D;
 Fri,  4 Jul 2025 09:24:39 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id DA94D5C5AB8;
 Fri,  4 Jul 2025 09:24:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C2AC6C4CEE3;
 Fri,  4 Jul 2025 09:24:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1751621078;
 bh=IWnv8wuvxjSLZu6TYH7AvRedSfu4EGdi6dGZhG1R0X0=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=X5ugVTKihbzZa05OkMV/cLal/5bAimpvswCAOaRNZj2wFXjeCAtUPiTSbRN5KcPDM
 0aJOA8mGqUHzTaNb7fB+25+rCgwfzL5aIEpbfHZ71H64mj6yG+ChTohvKgykLB90a0
 y+fd/KjPfDuwC8xKuhe8YQuJrM5dE0h0bzoW80m3k/RABq595aM+8cMGxqGaPODGQo
 gfLKri2qmEbE4zK4Hj/2cwK9AJtmaQoPaqh9HN2xGIk0OKMHMH89GLJjssZTToXzD5
 md4WRvpObwhWoivkrCYj6VykBRuKaR/gcQNiQlTNIKF02uBnYY4m+2tUao7IAJCY2O
 R/aJDUm+M4MHw==
Message-ID: <f202f889-2f20-4b5a-94b9-89b61147777e@kernel.org>
Date: Fri, 4 Jul 2025 11:24:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 17/80] drm/nouveau: Remove redundant
 pm_runtime_mark_last_busy() calls
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Lyude Paul <lyude@redhat.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Ben Skeggs <bskeggs@nvidia.com>,
 Dave Airlie <airlied@redhat.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 Jani Nikula <jani.nikula@intel.com>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Dmitry Baryshkov <lumag@kernel.org>, Suraj Kandpal
 <suraj.kandpal@intel.com>, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20250704075225.3212486-1-sakari.ailus@linux.intel.com>
 <20250704075410.3217943-1-sakari.ailus@linux.intel.com>
From: Danilo Krummrich <dakr@kernel.org>
Content-Language: en-US
In-Reply-To: <20250704075410.3217943-1-sakari.ailus@linux.intel.com>
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

On 7/4/25 9:54 AM, Sakari Ailus wrote:
> pm_runtime_put_autosuspend(), pm_runtime_put_sync_autosuspend(),
> pm_runtime_autosuspend() and pm_request_autosuspend() now include a call
> to pm_runtime_mark_last_busy(). Remove the now-reduntant explicit call to
> pm_runtime_mark_last_busy().
> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>

Acked-by: Danilo Krummrich <dakr@kernel.org>

