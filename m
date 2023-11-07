Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 00E307E4305
	for <lists+nouveau@lfdr.de>; Tue,  7 Nov 2023 16:13:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D950A10E039;
	Tue,  7 Nov 2023 15:13:13 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [IPv6:2a00:1450:4864:20::52f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9086E10E039
 for <nouveau@lists.freedesktop.org>; Tue,  7 Nov 2023 15:13:12 +0000 (UTC)
Received: by mail-ed1-x52f.google.com with SMTP id
 4fb4d7f45d1cf-53e3b8f906fso9703089a12.2
 for <nouveau@lists.freedesktop.org>; Tue, 07 Nov 2023 07:13:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1699369991; x=1699974791; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=O4WXKaSeWoGfYlucsjjghPQmVJ+U4PvCgWrXzJZGEcw=;
 b=lor9q3mHDU6baznGSErmI9wfONqVBi164ayiwNQggS69ryqlsyXGR3JlMnn5nxhd9m
 2w/0y5i7cRr0CSfVu8y3K/oIPA4O+CzOoUzKJSFd7qqI2eytEBQ5oNY8IFw7dHvDUIqo
 1GSuuFZtGdNoenT/Fxj2YVi7xcxEqkC4WtSfY9JO1kk0Yd8B1PhbD5/tHs3oaWvAk4nq
 ldv6+btBLnAbdYL9Vpuswvd9FE/NLXhbQIW39uqQEVNEzMDm3WsC/gQmp6HmMvi5nsuK
 l8mQvg5krIjKk7XZS4VvF2qWHbV15dQUfvjtpcpKLZagm6vgJY8UwMPmecsiGwPkeWBm
 d3Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699369991; x=1699974791;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=O4WXKaSeWoGfYlucsjjghPQmVJ+U4PvCgWrXzJZGEcw=;
 b=X/FJWYe6AlyEYSY5+ZteGgOozay3nntooKb8ooLIwjz7YVu7RJTV8XfvS4sndTBNml
 NdqzwvSmM2OcWZisMzmDMDdO8Ubm18m68RFUytK4xtDEUNzv5J7IKw1UxQOU2lisR+7d
 sfn9DXSJrgVfjNH6p7GdTB7DVkSHh6c6nxpWK72IsL6BIS/zkFvIWMwGaa6qbgLaD8IA
 lsuH9cb4LSReWYB+SY6qYyhxgS0BTGuEwDXAay/bUzRW61v+BXYcajNXbN8reDNYe2TH
 BQBogtOQn0rJFG7RHIR/t/cj0f5Q+a13AdQsTW1aoRy9eYeRhemZhXo/TGKmPPFTfnrt
 xhfA==
X-Gm-Message-State: AOJu0Yz8wfvdmJ234hVtdq3h4oneOT0ioOk/TtkcZwx31WLc0fgsRPZH
 +msasHxqfGkiP05syKHCDCIeag==
X-Google-Smtp-Source: AGHT+IGogKJJux6hwzx+Ffij90Mvr6R8w7LqCBipWqxrqvJrfOFX6c9UX7a/fopvkY/OQ7XY480Ygg==
X-Received: by 2002:a50:cd0d:0:b0:544:7c9b:6227 with SMTP id
 z13-20020a50cd0d000000b005447c9b6227mr5930774edi.4.1699369990985; 
 Tue, 07 Nov 2023 07:13:10 -0800 (PST)
Received: from localhost ([102.36.222.112]) by smtp.gmail.com with ESMTPSA id
 c19-20020aa7d613000000b00537666d307csm5472426edr.32.2023.11.07.07.13.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Nov 2023 07:13:10 -0800 (PST)
Date: Tue, 7 Nov 2023 18:13:07 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Philipp Stanner <pstanner@redhat.com>
Message-ID: <0b214db0-10eb-4c52-a6fd-aaa2b24d44a6@kadam.mountain>
References: <3554c52a-d500-4c8e-913f-c2a32a1f7a4d@moroto.mountain>
 <3dd2cd0407c19480b895a9af1423d6ac7269a039.camel@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3dd2cd0407c19480b895a9af1423d6ac7269a039.camel@redhat.com>
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
Cc: nouveau@lists.freedesktop.org
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On Tue, Nov 07, 2023 at 03:47:22PM +0100, Philipp Stanner wrote:
> On Tue, 2023-11-07 at 17:34 +0300, Dan Carpenter wrote:
> > Hello Ben Skeggs,
> 
> Hi,
> 
> FYI, Ben is not maintaining Nouveau anymore. The MAINTAINERS file has
> been updated in that regard.
> 

Yeah.  I got the bounce message from @redhat.com already.  But I Cc'd
the list so hopefully the right people will see this email...  Normally,
I just CC the list for cases where the maintainer is gone.

You need to update .get_maintainer.ignore as well if you really want to
avoid bounces.

regards,
dan carpenter

