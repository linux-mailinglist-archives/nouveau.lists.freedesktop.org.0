Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B3157E4354
	for <lists+nouveau@lfdr.de>; Tue,  7 Nov 2023 16:21:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F3A810E60A;
	Tue,  7 Nov 2023 15:21:02 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [IPv6:2a00:1450:4864:20::532])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F12810E60A
 for <nouveau@lists.freedesktop.org>; Tue,  7 Nov 2023 15:21:00 +0000 (UTC)
Received: by mail-ed1-x532.google.com with SMTP id
 4fb4d7f45d1cf-5435336ab0bso10012293a12.1
 for <nouveau@lists.freedesktop.org>; Tue, 07 Nov 2023 07:21:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1699370458; x=1699975258; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=2NkSVz3UJ9CN4iN3AXD4vkGXAp4124gqwjZ6Np1ZCvQ=;
 b=Rw2zLOReLng+85ystJRIbTEArHC1Gz05S76/zsoo5YrzFhsR/+QxwMfpFEDENyYRIi
 GWh+ieLcCx68L9KMUbVofOSEwvWYKOwIlEpdcjyQRJamwEfVHRtkhPvSgnTngIm5ujZt
 EKJ5Nuqum9rORfFDYYwk4IW/v1rMJyAOtSRdnNJLZtSS6IofLo+XAO5c2EFoY0I6MU1k
 xYj+3ksmFsrdMvpW5gJXjR9Cycf7VF9kvJ/2VXRsTm5WgdJlu/HBdJhQcFsHFzGzVOIt
 maoE+NGR1tHwqdKcLXYqZMmWr5H85FkeDhUrvBSnrTHO8INPc+65yBS61vPa63xGQzs1
 rrLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699370458; x=1699975258;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2NkSVz3UJ9CN4iN3AXD4vkGXAp4124gqwjZ6Np1ZCvQ=;
 b=LYlh9I3ng3RxE+lE6TTO6i7NXsvq1lnwBAfQytApv9T0iZzWDLUO5EG3Z0313TkQ+c
 4TRqLr2dk/zhnQ0lOQgzV/zE3dZ+B1akBiqfUrKPWgRTGPNamIxzPsFXe1COcvIPCT02
 3GsRtztBQ2wuObJ+y+IYyFM7uRVCGGQ98C5T4lDLZalVW0kd3IzL1MpbL/dCUNKx9uKQ
 0Igduhoi5LxKRI9OYyOJEtd7ewoGkYWyWQS9XbOEJsgSi0nDjoym+BWx+mSkRv5/+nV2
 t1z0WnsaBUMlkeDOfHj3xEk5QzwuF0TO9sQUNSgMK7zcfBjlMPAgYo5DiP0kWPaSbcNo
 QlUw==
X-Gm-Message-State: AOJu0YxSk3BtTM4hEGs4InG9vbG5sVHfPq4YW8I04ahaXQ3AmISF7E9L
 a+ezw7tygHwqlzQz6551AU7ejXAdLKLKxqj4aQFm1z1v
X-Google-Smtp-Source: AGHT+IGZETFwOW0MdTaWsVHW8gjt87p2jqbYXayqYLAY2pRUTnMOc0k0LUAANS8TYcwP75PO+aVSFw==
X-Received: by 2002:a50:9552:0:b0:543:7201:7c70 with SMTP id
 v18-20020a509552000000b0054372017c70mr18830972eda.7.1699370458381; 
 Tue, 07 Nov 2023 07:20:58 -0800 (PST)
Received: from localhost ([102.36.222.112]) by smtp.gmail.com with ESMTPSA id
 b67-20020a509f49000000b0053d9f427a6bsm5687086edf.71.2023.11.07.07.20.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Nov 2023 07:20:58 -0800 (PST)
Date: Tue, 7 Nov 2023 18:20:56 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: nouveau@lists.freedesktop.org
Message-ID: <4a0bbf8d-b36a-4551-90f4-0e956143ca5b@kadam.mountain>
References: <3554c52a-d500-4c8e-913f-c2a32a1f7a4d@moroto.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3554c52a-d500-4c8e-913f-c2a32a1f7a4d@moroto.mountain>
Subject: Re: [Nouveau] [bug report] drm/nouveau/gsp/r535: add support for
 booting GSP-RM
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

On Tue, Nov 07, 2023 at 05:34:43PM +0300, Dan Carpenter wrote:
> Hello Ben Skeggs,
> 
> The patch 176fdcbddfd2: "drm/nouveau/gsp/r535: add support for
> booting GSP-RM" from Sep 19, 2023 (linux-next), leads to the
> following Smatch static checker warning:
> 
> 	drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c:1016 r535_gsp_rpc_unloading_guest_driver()
> 	warn: 'rpc' isn't an ERR_PTR

Some related bugs are:

drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c:1058 r535_gsp_rpc_set_registry() warn: 'rpc' isn't an ERR_PTR
drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c:1273 r535_gsp_rpc_set_system_info() warn: 'info' isn't an ERR_PTR
drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c:611 r535_gsp_rpc_rm_alloc_get() warn: 'rpc' isn't an ERR_PTR
drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c:667 r535_gsp_rpc_rm_ctrl_get() warn: 'rpc' isn't an ERR_PTR
drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c:692 r535_gsp_rpc_get() warn: 'rpc' is an error pointer or valid
drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c:695 r535_gsp_rpc_get() error: 'rpc' dereferencing possible ERR_PTR()
drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c:735 r535_gsp_rpc_push() warn: 'next' isn't an ERR_PTR
drivers/gpu/drm/nouveau/nvkm/subdev/instmem/r535.c:69 fbsr_memlist() warn: 'rpc' isn't an ERR_PTR

regards,
dan carpenter

