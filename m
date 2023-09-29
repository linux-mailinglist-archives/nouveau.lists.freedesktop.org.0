Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BAA47B39ED
	for <lists+nouveau@lfdr.de>; Fri, 29 Sep 2023 20:20:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA26010E172;
	Fri, 29 Sep 2023 18:20:29 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com
 [IPv6:2607:f8b0:4864:20::632])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C98110E1A6
 for <nouveau@lists.freedesktop.org>; Fri, 29 Sep 2023 18:20:27 +0000 (UTC)
Received: by mail-pl1-x632.google.com with SMTP id
 d9443c01a7336-1c723f1c80fso42999535ad.1
 for <nouveau@lists.freedesktop.org>; Fri, 29 Sep 2023 11:20:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1696011627; x=1696616427;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=H/kevk4tNSCK4yq8Y8Eq8euOICXuk1g8ja9WwJ3j9fE=;
 b=SyNBCNdT5WKQAIZ8s6vPzq4kdrnQBUqsBXXPE3U4TIojTAYPsWFTzW849qnMZx081c
 Q0CXh2NzXZSCWWUFpEP4Nj9ZXVNlKBj7ylFZlkFZ4jwyaZjW/BqvHe+x1YEysPGKlEWP
 9ZMPb7pB9e0tWuWnB+PVREC6rLTmbzpJoAQ/c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696011627; x=1696616427;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=H/kevk4tNSCK4yq8Y8Eq8euOICXuk1g8ja9WwJ3j9fE=;
 b=CXvo0BFGWxfA5fobXUsGHpo70klnmaS6cE1D1naMftasuWLI763r0KMCiCBr7zeiXF
 3C8dzLsKIZJKnqXCEYilm0F9nx4Udj9WIdjLMaOLRL76lnniec8b3SRROFfXQMlsUqKb
 9Zs7cGY9Po4YGSnJ7h3xWZI6AdjoujvNuqLtGkWfXDsvd/nqFO2/+Qv3zhe081zEwDL0
 JRArH25fkdU3E4PIF+GapslP5NFaxtFvoP21etos5M5g/dyIvYWDBL/5/ck/HRVrhRNB
 3Gj/I307a0nvYE8i+P1Gj6PZrNe58gWh87Ag0pznj995mOLSqclWo7BwXrj3ubFJ7wBc
 DUug==
X-Gm-Message-State: AOJu0YwiTy3HqUrNflIoLt0IdNBdRXle60wmRnpu9UWL2gqHZ7r/TCmJ
 tYVqCYFOWFK7/mv/cVBSc84ULg==
X-Google-Smtp-Source: AGHT+IGcMZNuu5by/ybQZhXigau4jvxccIHAaE4PpspYWQGaz1tg3yDDLn1/20+ox//v17UMP49BKA==
X-Received: by 2002:a17:902:d2c7:b0:1bd:a42a:215e with SMTP id
 n7-20020a170902d2c700b001bda42a215emr5862019plc.38.1696011626675; 
 Fri, 29 Sep 2023 11:20:26 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net.
 [198.0.35.241]) by smtp.gmail.com with ESMTPSA id
 v3-20020a1709029a0300b001b850c9d7b3sm17135700plp.249.2023.09.29.11.20.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Sep 2023 11:20:26 -0700 (PDT)
From: Kees Cook <keescook@chromium.org>
To: Ben Skeggs <bskeggs@redhat.com>, Karol Herbst <kherbst@redhat.com>,
 Lyude Paul <lyude@redhat.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>
Date: Fri, 29 Sep 2023 11:20:01 -0700
Message-Id: <169601159821.3006883.15782981674963813068.b4-ty@chromium.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1692208802.git.gustavoars@kernel.org>
References: <cover.1692208802.git.gustavoars@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: Re: [Nouveau] [PATCH 0/2][next] nouveau/svm: Replace one-element
 array with flexible-array member
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
Cc: nouveau@lists.freedesktop.org, linux-hardening@vger.kernel.org,
 Kees Cook <keescook@chromium.org>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On Wed, 16 Aug 2023 12:03:06 -0600, Gustavo A. R. Silva wrote:
> This small series aims to replace a one-element array with a
> flexible-array member in struct nouveau_svm. And, while at it,
> fix a checkpatch.pl error.
> 
> Gustavo A. R. Silva (2):
>   nouveau/svm: Replace one-element array with flexible-array member in
>     struct nouveau_svm
>   nouveau/svm: Split assignment from if conditional
> 
> [...]

These look trivially correct and haven't had further feedback for over a month.

Applied to for-next/hardening, thanks!

[1/2] nouveau/svm: Replace one-element array with flexible-array member in struct nouveau_svm
      https://git.kernel.org/kees/c/6ad33b53c9b8
[2/2] nouveau/svm: Split assignment from if conditional
      https://git.kernel.org/kees/c/4cb2e89fea5f

Take care,

-- 
Kees Cook

