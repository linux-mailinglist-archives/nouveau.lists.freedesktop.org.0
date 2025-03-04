Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DE51A4D39D
	for <lists+nouveau@lfdr.de>; Tue,  4 Mar 2025 07:16:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0AAFA89B33;
	Tue,  4 Mar 2025 06:16:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="paDrIVQU";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com
 [209.85.221.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 65FC489B33
 for <nouveau@lists.freedesktop.org>; Tue,  4 Mar 2025 06:16:39 +0000 (UTC)
Received: by mail-wr1-f51.google.com with SMTP id
 ffacd0b85a97d-390fdaf2897so2369272f8f.0
 for <nouveau@lists.freedesktop.org>; Mon, 03 Mar 2025 22:16:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1741068995; x=1741673795; darn=lists.freedesktop.org;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=/nKPX6DIjshEMAUl1KOyqAjGkCUe+ICt9ye1bUSmbrI=;
 b=paDrIVQUHdbC0vTnDBNYI2oIuSGavPdwxH/fevqBM2Df/WrMYwNDVUD7dViqJhp2rV
 q2Nli0qE15D3GWv1cVjKwm2/40tsMtt/DTt8KRTkuDT5cv/IM71YI2sPHwqLW62X/BSA
 kGLr2R0RjlSDLnWyTgNRVCFe+zQCQxkzi1Q2Uq6QFTK4kAXdAefp2FjmP2onteP/1P3c
 PhuvDK2wfRrLGcVR85+ISTavdaQO8APXhQkERmCBknjC0PYERbDgDu1jPZ7lhYCFkaEs
 jeloej22GNmfbeHtmYVKUxiOGpjje9VSO6j1ZwJIhzBJjHjt+HFM1JIYXiQGwm5gpOYL
 KA8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741068995; x=1741673795;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=/nKPX6DIjshEMAUl1KOyqAjGkCUe+ICt9ye1bUSmbrI=;
 b=XOETkgZ+yx35DGal6vIwRP6au1GB/KVdMk0o3HzkNFy5oNi1YeCS9TuJctydQntuBL
 bpM1FegLs0eLxLlSwnHYd0VDHR3Ohu+xeZF2hcDvQB/he41F8Py/Y9Ou7C12Y34qIjkJ
 BvmCMtnhb0UGWE9eX+x+2yyXqpjRTVsL83KAzVfnh/WaTCiKLMN9+rprgjkuMSCb01Tl
 xwNAhbYDwUAAVzZOHj155LG1JeyzFiKzZV334G4i4NlWWI0I5F/C5+giqGhJLALTdmYt
 bABjYOO7rFzKxN4ZIUQDP6swhrd/0mgXPJ6195FBTQ8Bbb0UP/Q46WqwC7QagVJrCkbp
 ojWg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUkDJT4FsJfC1eD/zFPMFu4rrGgRf54p3RidvlrZvUme+Z7j4KQ7djM/yYaOPlkjlh5uT62/qGu@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy8xJkA/WneVWKc27l7zuaSKpvHIt9k/AIx1YWV/5LUqrcjMZ1V
 RCBVm/kAqQws0atOHKzRCZ9SAfnkA2FnIfUvBwfDpB26PKLeM3ORXmWR+KSE4EQ=
X-Gm-Gg: ASbGncsBqJbkMX8gCokk6cFJWd93NFCBlIg7klajd48kFVS/NR7xnoj+TDnmj7x/1t3
 zu008AtQ368IE1xkBYrjIssj7iz0An5Umg7GD8OUllcC9vCWka7f3IayBAHeD6zfY8vAo/pSKJ+
 ddgj8snT6D4GoNewK5N5mPq5m+P49eFvgnERhCYD+qRXgp8JSnhnKbxSmLkiczBWAtnE7Ay0kbk
 Ry27zli+UPTb4hEFLeaqxwSLWKWc5Bn8xAhQIk7039e2eyoP9i+VuOujjXy++zxfcVCqYm+p8xA
 WvzZ2dhhN2OYNMHVZfwrM5kjtg2BShY70KJT4WGKMtJb1e10CQ==
X-Google-Smtp-Source: AGHT+IHGIpUcpblova9lskxdumW2y8lPrejnCbvxgbQgqTl6SZZm6j7C3FFjt6dcr0CvmsmXKYeMQQ==
X-Received: by 2002:a05:6000:186d:b0:391:13ef:1b35 with SMTP id
 ffacd0b85a97d-39113ef1da9mr2356446f8f.29.1741068994861; 
 Mon, 03 Mar 2025 22:16:34 -0800 (PST)
Received: from localhost ([196.207.164.177])
 by smtp.gmail.com with UTF8SMTPSA id
 ffacd0b85a97d-390e479608fsm16819421f8f.14.2025.03.03.22.16.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Mar 2025 22:16:34 -0800 (PST)
Date: Tue, 4 Mar 2025 09:16:30 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Danilo Krummrich <dakr@kernel.org>
Cc: Markus Elfring <Markus.Elfring@web.de>, kernel-janitors@vger.kernel.org,
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Ben Skeggs <bskeggs@redhat.com>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@gmail.com>, Karol Herbst <kherbst@redhat.com>,
 Lyude Paul <lyude@redhat.com>, Simona Vetter <simona@ffwll.ch>,
 cocci@inria.fr, LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH RESEND] drm/nouveau: Add a jump label in
 nouveau_gem_ioctl_pushbuf()
Message-ID: <bd5220d3-e2f5-4688-919c-bd65f4a41eb2@stanley.mountain>
References: <f9303bdc-b1a7-be5e-56c6-dfa8232b8b55@web.de>
 <8f785de5-ebe2-edd9-2155-f440acacc643@web.de>
 <809905c6-73c0-75a6-1226-048d8cb8dfda@web.de>
 <684bfc0d-7e1d-40f1-b1b7-d6ed64fcd8b7@web.de>
 <Z8YF0kkYLlh1m5ys@pollux>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Z8YF0kkYLlh1m5ys@pollux>
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

On Mon, Mar 03, 2025 at 08:41:06PM +0100, Danilo Krummrich wrote:
> On Mon, Mar 03, 2025 at 06:49:07PM +0100, Markus Elfring wrote:
> > From: Markus Elfring <elfring@users.sourceforge.net>
> > Date: Wed, 5 Apr 2023 18:38:54 +0200
> > 
> > The label “out_prevalid” was used to jump to another pointer check
> > despite of the detail in the implementation of the function
> > “nouveau_gem_ioctl_pushbuf” that it was determined already in one case
> > that the corresponding variable contained an error pointer
> > because of a failed call of the function “u_memcpya”.
> > 
> > Thus use an additional label.
> > 
> > This issue was detected by using the Coccinelle software.
> > 
> > Fixes: 2be65641642e ("drm/nouveau: fix relocations applying logic and a double-free")
> > Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
> 
> I'm not entirely sure, but I remember that we had this discussion already.
> 
> Can you please send patches from the same address as indicated by your SoB?

This is not a bug fix so it shouldn't have a Fixes tag.

regards,
dan carpenter
