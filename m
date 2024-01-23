Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 06ED08389CB
	for <lists+nouveau@lfdr.de>; Tue, 23 Jan 2024 09:57:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C80A10E14A;
	Tue, 23 Jan 2024 08:57:55 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com
 [209.85.221.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2543F10E14A
 for <nouveau@lists.freedesktop.org>; Tue, 23 Jan 2024 08:57:54 +0000 (UTC)
Received: by mail-wr1-f52.google.com with SMTP id
 ffacd0b85a97d-33921b95dddso1906045f8f.1
 for <nouveau@lists.freedesktop.org>; Tue, 23 Jan 2024 00:57:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1706000212; x=1706605012; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=GcK6zvLFuwSh9mo7ySciDzTNwWqWuU+gHFUQY91mYpM=;
 b=hPDtBk8mjyQaBW3KuL1sNIy8AwDwMHvMaj1YoWvJjwxJfFR739G+r3sRhfxCBhy4Yt
 CVz1wRsDsHc4vI4L3OiRbxnzdn1Bf0NUYJ+dChtRUyDmnxxP3zSM4BW/F41F1KYXxp8c
 7taV7cdw3T589WSOQFrjoDZrNoLrYnp6q/3lyktr5pZVUCfDtFy5SLw/GM9vAPYbbXYa
 7f1WBixRwB1kpJyl1LZKEXQXL4Yw8OqBaN83wXahRDApb1f+3iiV9DGa7tS+Vt9ZlEwy
 r4JbVm2P6hYu6p1ESq+0GMrS+gAhY6baRBu0fKj0yorBAcDTGGpBajA03fWDO+XC9i1c
 ltkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706000212; x=1706605012;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GcK6zvLFuwSh9mo7ySciDzTNwWqWuU+gHFUQY91mYpM=;
 b=EkHQ+f1+wmFQMWxjiWNSDfhnXYTuwGnGrprvxIUD2Zbhn+1UM8Xgb6QmzLcsA19IF+
 u3sIoB+Om35wvQ2CrohvxbJsLAl3qRm5Ko85r/vcV5N6V/U9RKMIGMSxbrXYg0BFeJ0F
 o11kEtLysRDFwxHp5yqkJeI0kX9OhCNZxhas+jMaJQimXq7FnJrMnCPPSpTElaOJdoeF
 oLpmTPruhiSoD9jlmdg+ArgeychyuSKmrHtrTmHcTudV0TUiKm0liexBjAKi9609cp01
 8/NjgleOPYwj5v7BmsfGzWQGdsquR+hieAGE2ChEMbwuV0PwTNOBTC/1daXFGBV4EQFJ
 8nXQ==
X-Gm-Message-State: AOJu0YyjNaP0CYHsM4W9M8vcWE2GkDSCsDBaOImAxqP54HKWHMHuZJ5o
 PTf7HaDpejQsG6as7qjsBf2w73slbFm1viwe0AJmNHVxrM4kWxI3H9upsqeBLYI=
X-Google-Smtp-Source: AGHT+IE83CqPYcjrXGj6lFrWB/MgUBCFYVdyddu4KjguVtrvYTGjEjec+5PDM6H+aqHZoQ35inLXdg==
X-Received: by 2002:a05:600c:1f05:b0:40d:80a1:867 with SMTP id
 bd5-20020a05600c1f0500b0040d80a10867mr276491wmb.146.1706000212591; 
 Tue, 23 Jan 2024 00:56:52 -0800 (PST)
Received: from localhost ([102.140.209.237]) by smtp.gmail.com with ESMTPSA id
 f6-20020a05600c154600b0040e880ac6ecsm21864357wmg.35.2024.01.23.00.56.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Jan 2024 00:56:52 -0800 (PST)
Date: Tue, 23 Jan 2024 11:56:49 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Danilo Krummrich <dakr@redhat.com>, Felix Fietkau <nbd@nbd.name>
Subject: Re: [PATCH][next] drm/nouveau/fifo/gk104: remove redundant variable
 ret
Message-ID: <fe659736-500f-4e59-a9c7-ad894155a675@moroto.mountain>
References: <20240116111609.2258675-1-colin.i.king@gmail.com>
 <aafe669f-b322-4f22-a48e-564e3eb3447f@moroto.mountain>
 <bdc7e401-a676-4040-9138-8dc5cf35bd05@redhat.com>
 <55f0983a-300e-40bb-9142-6f4683914402@moroto.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <55f0983a-300e-40bb-9142-6f4683914402@moroto.mountain>
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
Cc: nouveau@lists.freedesktop.org, kernel-janitors@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Daniel Vetter <daniel@ffwll.ch>, Colin Ian King <colin.i.king@gmail.com>
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

Let's CC Felix on this one because he might know the answer.

All day long I spend looking at code like this:

net/core/dev.c:724 dev_fill_forward_path() info: returning a literal zero is cleaner
net/core/dev.c:732 dev_fill_forward_path() info: returning a literal zero is cleaner

net/core/dev.c
   696  int dev_fill_forward_path(const struct net_device *dev, const u8 *daddr,
   697                            struct net_device_path_stack *stack)
   698  {
   699          const struct net_device *last_dev;
   700          struct net_device_path_ctx ctx = {
   701                  .dev    = dev,
   702          };
   703          struct net_device_path *path;
   704          int ret = 0;
   705  
   706          memcpy(ctx.daddr, daddr, sizeof(ctx.daddr));
   707          stack->num_paths = 0;
   708          while (ctx.dev && ctx.dev->netdev_ops->ndo_fill_forward_path) {
   709                  last_dev = ctx.dev;
   710                  path = dev_fwd_path(stack);
   711                  if (!path)
   712                          return -1;
   713  
   714                  memset(path, 0, sizeof(struct net_device_path));
   715                  ret = ctx.dev->netdev_ops->ndo_fill_forward_path(&ctx, path);
   716                  if (ret < 0)

This if condition might trick you into thinking that ->ndo_fill_forward_path()
can return non-zero positive numbers, but it can't.  It returns zero on
success or negative error codes on failure.  Smatch is doing cross
function analysis so we know this.

   717                          return -1;
   718  
   719                  if (WARN_ON_ONCE(last_dev == ctx.dev))
   720                          return -1;
   721          }
   722  
   723          if (!ctx.dev)
   724                  return ret;

Is this intentional or not?  Who knows?  If this were an obvious bug,
I could fix it right away but ambiguous stuff like this takes way more
time to deal with.

   725  
   726          path = dev_fwd_path(stack);
   727          if (!path)
   728                  return -1;
   729          path->type = DEV_PATH_ETHERNET;
   730          path->dev = ctx.dev;
   731  
   732          return ret;

Obviously this is intentional, but if you were tricked by the checking
earlier then you might assume that ret is some positive value from the
last iteration through the loop.  "return 0;" is so much clearer.

   733  }

regards,
dan carpetner

