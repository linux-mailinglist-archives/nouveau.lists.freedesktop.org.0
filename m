Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C550477EAD6
	for <lists+nouveau@lfdr.de>; Wed, 16 Aug 2023 22:39:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 16BD810E3B8;
	Wed, 16 Aug 2023 20:39:02 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com
 [IPv6:2607:f8b0:4864:20::62d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 60F9010E3B8
 for <nouveau@lists.freedesktop.org>; Wed, 16 Aug 2023 20:38:59 +0000 (UTC)
Received: by mail-pl1-x62d.google.com with SMTP id
 d9443c01a7336-1bee82fab5aso13733495ad.3
 for <nouveau@lists.freedesktop.org>; Wed, 16 Aug 2023 13:38:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1692218339; x=1692823139;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=mebqjsm4NZp8ScdZvCRAS9NYd++02rPC44UvNuMOWag=;
 b=B+9GwZKIjimcZET39jiEv3WT0GoLENkoUfDXOud4xZGq1bLQ1uxHedO/2+FXbu7uVA
 Y9WlkpPr4WpBzxpKyuS8Pvf+B1kG+L9oA4H2PNzOk4n1hZl3E0VlEt2/uWNI9vGw0Lv1
 Uug01LJbx6MbgyC/oVAaHSUyikQJHyIlZe/Q0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692218339; x=1692823139;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mebqjsm4NZp8ScdZvCRAS9NYd++02rPC44UvNuMOWag=;
 b=kDANlmSY7/MKGk51gg6v+hk+JDqbGwJBqXwYjamdYVpZrUTA3SirZWCEwmde8kxHEi
 tx0tmacGJe7mAW8KNL4a6jEgDg2nbK+LjaB/04PAvov7rq/gCrLCcKM/y1UyDPOd3hIp
 Crb0ovt4xOfVhcf2uY/0TojbE4SOLhLBXAya4ZPdmPOHoXgtGWdKf3YlNAG6C+TW1N6G
 VsgDth8cV/JvQpqp51gHTMlJ7MOfBCVz0AEB+4eG8YXIu9rGKzve7F+RWoECvUBF9RR+
 blERv6ibYggscTqiuuxcQd1rC3OuI0uTw0Z5C/Dno3GIaL/DUbwK+i1twNG3VsmKsFIP
 leJQ==
X-Gm-Message-State: AOJu0YwRrBcIAl32ZnFdxXbbG/CjyjAR2JOt5Edz2ozAzcLPLmZ0g2gh
 cfUXVDecW5Yj5tCu4FaZy0osmQ==
X-Google-Smtp-Source: AGHT+IH8TNVv8K24tYufYWfhj6FReA3GRy3bUNjldrAPON0uLm7g+SZDkIHCoYjL1zNAe1G0wAMRyA==
X-Received: by 2002:a17:902:c94e:b0:1bb:598a:14e5 with SMTP id
 i14-20020a170902c94e00b001bb598a14e5mr2728850pla.43.1692218338963; 
 Wed, 16 Aug 2023 13:38:58 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net.
 [198.0.35.241]) by smtp.gmail.com with ESMTPSA id
 f10-20020a170902ce8a00b001b7fd27144dsm13607893plg.40.2023.08.16.13.38.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Aug 2023 13:38:58 -0700 (PDT)
Date: Wed, 16 Aug 2023 13:38:58 -0700
From: Kees Cook <keescook@chromium.org>
To: "Gustavo A. R. Silva" <gustavoars@kernel.org>
Message-ID: <202308161338.C7162E7@keescook>
References: <cover.1692208802.git.gustavoars@kernel.org>
 <6b900e80b5587187c68efc788f5b042ca747d374.1692208802.git.gustavoars@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6b900e80b5587187c68efc788f5b042ca747d374.1692208802.git.gustavoars@kernel.org>
Subject: Re: [Nouveau] [PATCH 2/2][next] nouveau/svm: Split assignment from
 if conditional
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
Cc: nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Ben Skeggs <bskeggs@redhat.com>,
 Daniel Vetter <daniel@ffwll.ch>, linux-hardening@vger.kernel.org
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On Wed, Aug 16, 2023 at 12:05:06PM -0600, Gustavo A. R. Silva wrote:
> Fix checkpatch.pl ERROR: do not use assignment in if condition.
> 
> Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>

Reviewed-by: Kees Cook <keescook@chromium.org>

-- 
Kees Cook
