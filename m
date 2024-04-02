Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CD33D8A38BC
	for <lists+nouveau@lfdr.de>; Sat, 13 Apr 2024 01:09:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E877710F921;
	Fri, 12 Apr 2024 23:09:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="l55a3AM4";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9917310F3DB;
 Tue,  2 Apr 2024 08:29:58 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id E84AF60F81;
 Tue,  2 Apr 2024 08:29:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0A6A2C43394;
 Tue,  2 Apr 2024 08:29:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1712046597;
 bh=KLiOyU5gxLUsegc5eE8/HwQZQ1rmvicDU4hOpKd3aeo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=l55a3AM46XbBh4JItwGhAxKslyWIKIYKui6nTuLqnelnvoCzqlpqOBF855wp5JiYA
 Yowmji/9KFQKT7t3FXrheQWOfrZKhf4TXyansdGzhWv+JZ0NKjtP2vXTecC/0VBNXb
 iyeRoNhrs0sqvkO3VW5XtNeqcA6vj8bE4n+Bku10Paa7Sw2yozjgMMQor1qpvpJeni
 NYcWL13S4L1UDvWSpOd96u0uvRmBx+otENbremo5gbkAPR5nG4KtoKeteSAikD4VQo
 aHJSXR2CScq7H9dhwpbQ9dZeGJASNTbz3sbft5dih+eH9O18+aPLDPwjNCJ64V3l+M
 Jnld7gjc+HRxA==
Date: Tue, 2 Apr 2024 09:29:51 +0100
From: Simon Horman <horms@kernel.org>
To: Easwar Hariharan <eahariha@linux.microsoft.com>
Cc: Edward Cree <ecree.xilinx@gmail.com>,
 Martin Habets <habetsm.xilinx@gmail.com>,
 "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 "open list:SFC NETWORK DRIVER" <netdev@vger.kernel.org>,
 "open list:SFC NETWORK DRIVER" <linux-net-drivers@amd.com>,
 open list <linux-kernel@vger.kernel.org>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>,
 "open list:RADEON and AMDGPU DRM DRIVERS" <amd-gfx@lists.freedesktop.org>,
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>,
 "open list:INTEL DRM DISPLAY FOR XE AND I915 DRIVERS"
 <intel-gfx@lists.freedesktop.org>, 
 "open list:INTEL DRM DISPLAY FOR XE AND I915 DRIVERS"
 <intel-xe@lists.freedesktop.org>, 
 "open list:DRM DRIVER FOR NVIDIA GEFORCE/QUADRO GPUS"
 <nouveau@lists.freedesktop.org>, 
 "open list:I2C SUBSYSTEM HOST DRIVERS" <linux-i2c@vger.kernel.org>,
 "open list:BTTV VIDEO4LINUX DRIVER" <linux-media@vger.kernel.org>,
 "open list:FRAMEBUFFER LAYER" <linux-fbdev@vger.kernel.org>
Subject: Re: [PATCH v0 10/14] sfc: falcon: Make I2C terminology more inclusive
Message-ID: <20240402082951.GG26556@kernel.org>
References: <20240329170038.3863998-1-eahariha@linux.microsoft.com>
 <20240329170038.3863998-11-eahariha@linux.microsoft.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240329170038.3863998-11-eahariha@linux.microsoft.com>
X-Mailman-Approved-At: Fri, 12 Apr 2024 23:09:06 +0000
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

On Fri, Mar 29, 2024 at 05:00:34PM +0000, Easwar Hariharan wrote:
> I2C v7, SMBus 3.2, and I3C specifications have replaced "master/slave"
> with more appropriate terms. Inspired by and following on to Wolfram's
> series to fix drivers/i2c/[1], fix the terminology for users of
> I2C_ALGOBIT bitbanging interface, now that the approved verbiage exists
> in the specification.
> 
> Compile tested, no functionality changes intended
> 
> [1]: https://lore.kernel.org/all/20240322132619.6389-1-wsa+renesas@sang-engineering.com/
> 
> Signed-off-by: Easwar Hariharan <eahariha@linux.microsoft.com>

Reviewed-by: Simon Horman <horms@kernel.org>

