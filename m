Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 21700A15239
	for <lists+nouveau@lfdr.de>; Fri, 17 Jan 2025 15:54:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C1CA510EB10;
	Fri, 17 Jan 2025 14:54:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="HxZZXBDN";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E75810EB10
 for <nouveau@lists.freedesktop.org>; Fri, 17 Jan 2025 14:54:38 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 3BCCF5C62F8;
 Fri, 17 Jan 2025 14:53:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 84EB2C4CEDD;
 Fri, 17 Jan 2025 14:54:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1737125677;
 bh=JSHvEoM4+Qj+sKhzuS8a+HcdLXFq5kdzE4UjHJaB1zw=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=HxZZXBDNS4gChZ9QZVUEm2nQwRn7c0BHQ4VMQfRB7vYcAas02sF7vzK/0ckLAIcQC
 +Nh4Vm+76b22SZCGebBGB6PVr7EHunnTGdR9U42vNFaCbrxw8qjKNEyjo0iJwhqW28
 lwLrWOmFtvkjQKBd0cznujG90m7o7jbBeZU9sAFOXnbB/OqyPiVnkQmzWphtCCigXr
 8jEO8xKaf1iSatWbh9BLMWvXXLTTPt0GaPZmHjzEp51YM/wI0IctgqqaLf/nInkQh1
 Tii3sa27UDYb+oB2ImFzp7RdXwccg1SvmT5m0YXbA/g2qLb7BHwaVM2PK0lThZP0gj
 pDrMc/Ezz7M6w==
Message-ID: <d1c228cb-601a-4655-b9d1-b7e589a74313@kernel.org>
Date: Fri, 17 Jan 2025 15:54:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC 4/8] drm/nouveau: scrub the FB memory when scrubber firmware
 is loaded
To: Timur Tabi <ttabi@nvidia.com>
Cc: "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 Zhi Wang <zhiw@nvidia.com>, Jason Gunthorpe <jgg@nvidia.com>,
 Kirti Wankhede <kwankhede@nvidia.com>, Surath Mitra <smitra@nvidia.com>,
 Andy Currid <acurrid@nvidia.com>, Ankit Agrawal <ankita@nvidia.com>,
 Milos Tijanic <mtijanic@nvidia.com>, "airlied@gmail.com"
 <airlied@gmail.com>, "Tarun Gupta (SW-GPU)" <targupta@nvidia.com>,
 "zhiwang@kernel.org" <zhiwang@kernel.org>, Aniket Agashe
 <aniketa@nvidia.com>, "daniel@ffwll.ch" <daniel@ffwll.ch>,
 Neo Jia <cjia@nvidia.com>, Ben Skeggs <bskeggs@nvidia.com>
References: <20241122125712.3653406-1-zhiw@nvidia.com>
 <20241122125712.3653406-5-zhiw@nvidia.com>
 <3df5a9c78e79d46680812fa6354fa9606b3166b2.camel@nvidia.com>
From: Danilo Krummrich <dakr@kernel.org>
Content-Language: en-US
In-Reply-To: <3df5a9c78e79d46680812fa6354fa9606b3166b2.camel@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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

On 1/9/25 11:58 PM, Timur Tabi wrote:
> On Fri, 2024-11-22 at 04:57 -0800, Zhi Wang wrote:
>> +static int
>> +ad102_execute_scrubber(struct nvkm_gsp *gsp)
>> +{
>> +	struct nvkm_falcon_fw fw = {0};
>> +	struct nvkm_subdev *subdev = &gsp->subdev;
>> +	struct nvkm_device *device = subdev->device;
>> +	int ret;
>> +
>> +	if (!gsp->fws.scrubber || is_scrubber_completed(gsp))
>> +		return 0;
> 
> Shouldn't it be a bug if fws.scrubber is not defined?  If we need the
> scrubber and it doesn't exist, then I don't think it should silently fail.

I think already bail out in ad102_gsp_init_fw_heap() when we failt to load the 
firmware.

This check seems necessary, since gsp->fb.wpr2.heap.size might be smaller than 
256M and then we never load the scrubber fw.
