Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D6E1A8A38C5
	for <lists+nouveau@lfdr.de>; Sat, 13 Apr 2024 01:09:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A215910F930;
	Fri, 12 Apr 2024 23:09:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.microsoft.com header.i=@linux.microsoft.com header.b="RwqT6YsJ";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by gabe.freedesktop.org (Postfix) with ESMTP id D793010E56F;
 Thu,  4 Apr 2024 19:18:08 +0000 (UTC)
Received: from [100.64.1.95] (unknown [20.29.225.195])
 by linux.microsoft.com (Postfix) with ESMTPSA id C9C2320E94A7;
 Thu,  4 Apr 2024 12:18:07 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com C9C2320E94A7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
 s=default; t=1712258288;
 bh=A7Q2axkjCx78vPEBshdngJM72aZQ9s5wZHp2jmg55+0=;
 h=Date:Subject:To:References:From:In-Reply-To:From;
 b=RwqT6YsJmdnnrXHHFSbq9RKV256RC5Z2Qt1RVhzqRL41d+g/++plFbI7OaU0y5lXa
 xK8Id/EOOOiRvURMOaHIKIxUsjRApKXm1zpvse7+6DRvz6Eo35XBhJyn02mxudZJMU
 R8AAFulwPcZAJ5CM+lurbHElalUA+2ztG0FICXFk=
Message-ID: <0c6ff90d-0709-4fc5-951e-1b0f0b1273dc@linux.microsoft.com>
Date: Thu, 4 Apr 2024 12:18:06 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v0 10/14] sfc: falcon: Make I2C terminology more inclusive
To: Edward Cree <ecree.xilinx@gmail.com>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
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
References: <20240329170038.3863998-1-eahariha@linux.microsoft.com>
 <20240329170038.3863998-11-eahariha@linux.microsoft.com>
 <20240402090028.GA1759653@gmail.com>
Content-Language: en-CA
From: Easwar Hariharan <eahariha@linux.microsoft.com>
In-Reply-To: <20240402090028.GA1759653@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Fri, 12 Apr 2024 23:09:09 +0000
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

On 4/2/2024 2:00 AM, Martin Habets wrote:
> On Fri, Mar 29, 2024 at 05:00:34PM +0000, Easwar Hariharan wrote:
>> I2C v7, SMBus 3.2, and I3C specifications have replaced "master/slave"
>> with more appropriate terms. Inspired by and following on to Wolfram's
>> series to fix drivers/i2c/[1], fix the terminology for users of
>> I2C_ALGOBIT bitbanging interface, now that the approved verbiage exists
>> in the specification.
>>
>> Compile tested, no functionality changes intended
>>
>> [1]: https://lore.kernel.org/all/20240322132619.6389-1-wsa+renesas@sang-engineering.com/
>>
>> Signed-off-by: Easwar Hariharan <eahariha@linux.microsoft.com>
> 
> Reviewed-by: Martin Habets <habetsm.xilinx@gmail.com>
> 

Thank you, Martin, for reviewing. I believe that we are settling on controller/target
terminology from feedback on the other drivers in this series. Would you want to re-review
v1 with that change, or should I add your R-B in v1 despite the change?

Thanks,
Easwar

