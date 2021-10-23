Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E790F43813A
	for <lists+nouveau@lfdr.de>; Sat, 23 Oct 2021 03:11:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D23E6E5BB;
	Sat, 23 Oct 2021 01:11:44 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-yb1-xb31.google.com (mail-yb1-xb31.google.com
 [IPv6:2607:f8b0:4864:20::b31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1AC126E5B4
 for <nouveau@lists.freedesktop.org>; Sat, 23 Oct 2021 01:11:43 +0000 (UTC)
Received: by mail-yb1-xb31.google.com with SMTP id o17so10757529ybq.4
 for <nouveau@lists.freedesktop.org>; Fri, 22 Oct 2021 18:11:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:from:date:message-id:subject:to;
 bh=PmnLOuWtPYteZbhuXIFdUUQ6nDiq8lkfhux+/Xr089E=;
 b=dUwd+u+hsvQCp/KyTzOD56PzsM4yozfMg7+0uBQLIHPnc3yhRR9ABBYv73+hQjCk07
 x/tJqECxE7onHe3eGmGbxfNyrqDiwsmkPeBVyEaGMEPApavdfIian9jmo7ZTrVM8Wn+Y
 p5WdH3vSH7puEYVKzsc6MsmiI+FQaz5m1tjiQ25Hgk2RaH0vVQiu608vFQknX6MHFWnu
 Sjlr9fK4TuZKbtyheMCp1rtngcQt66F+iWGfEGonu/uD8NqR8u6scuwkooO5z6XkAW5q
 ufy8k8bW31V5EUrQFwN4IifeOFvx+hKIlHVkZCnPcmDYJ8x7pOE/VqBoDH2RYGpdXhl4
 X1YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=PmnLOuWtPYteZbhuXIFdUUQ6nDiq8lkfhux+/Xr089E=;
 b=4Qai5bDVMQcC5ynizZpgAb+rje6a7c+tM9WPitiN/8jr9gLwuzKg1vQIobQs+K9jc7
 BtWzsoGHa6G9CuuyCKCJ2A4v3qdTXtdtjgvmAtstffGsMapeiAXP9KKGg0KbYcyhf0su
 d/+nXMfkg8GEYN8nS7uOKu1Sie8G3VOOdyNwbOqDviem6v7db0seQFKs0ao58Bwl8t0O
 0V+xPdWxBvoXZSJs3tvCrVMsMRy41ZCqhgobIbS++updvP2X3tadcDv1PCdLynTB7ahX
 yDVKcRrxSVHDMYdsdawMosDKk+rAm3ht9797viKE0hbrbkOVIpdlGxulU9QHuUiheOnu
 6W3Q==
X-Gm-Message-State: AOAM531qpyXyyoMF8p/eVJsPt0JOd1ZFQrKu2foQgZT2KuWzz3rjiOMX
 HE0KYHujwww/JH211g00spJnaW8L7g1GQ3EzDFNo3iN3mWQ=
X-Google-Smtp-Source: ABdhPJykfcIyp8EUkrwl16HXZPFMxaE961zxlXmTMIf9f4NjYsk9ag4aji4zafMzGgppjhXA0lZVC9cdIpHCyNME1xg=
X-Received: by 2002:a25:d85:: with SMTP id 127mr3480780ybn.102.1634951501999; 
 Fri, 22 Oct 2021 18:11:41 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a05:7000:3bd6:0:0:0:0 with HTTP; Fri, 22 Oct 2021 18:11:41
 -0700 (PDT)
From: Amol <suratiamol@gmail.com>
Date: Sat, 23 Oct 2021 06:41:41 +0530
Message-ID: <CA+nuEB-PEyvNUXAbMk0wPQ2CbpewzJs9TXr1eDUc-N5tyqPmSA@mail.gmail.com>
To: nouveau <nouveau@lists.freedesktop.org>
Content-Type: text/plain; charset="UTF-8"
Subject: [Nouveau] getMNP_single calculations
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

Hello,

I am trying to understand the clock calculations found inside the function
getMNP_single at [1].

Before the loop, there's a check made to see if applying the maximum possible
post-divider (P) to the minimum possible VCO-output-frequency (minvco) still
gives an output resultant frequency that is larger than the required frequency
(clk). If so, the minimum VCO-output-frequency being considered is set to
clk * log2(max-post-divider).

The relevant piece of code:

P = 1 << maxP;
if ((clk * P) < minvco) {
        minvco = clk * maxP;
        maxvco = minvco * 2;
}

Would it not be proper to set minvco to clk * max-post-divider? That is,
minvco = clk * P, or minvco = clk << maxP? That should keep the
VCO-output-frequency closer to the original minvco, whereas
clk * log2(max-post-divider) brings it further down.

Thanks,
Amol

[1] https://lxr.missinglinkelectronics.com/linux+v5.14/drivers/gpu/drm/nouveau/nvkm/subdev/clk/pllnv04.c#L29
