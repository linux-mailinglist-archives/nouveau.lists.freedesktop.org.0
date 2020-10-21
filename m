Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D69A8295043
	for <lists+nouveau@lfdr.de>; Wed, 21 Oct 2020 17:56:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5EFBA6E3C6;
	Wed, 21 Oct 2020 15:56:39 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 79B696EDBE
 for <nouveau@lists.freedesktop.org>; Wed, 21 Oct 2020 15:11:44 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id c77so2561043wmd.4
 for <nouveau@lists.freedesktop.org>; Wed, 21 Oct 2020 08:11:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jguk.org; s=google;
 h=from:subject:to:cc:message-id:date:user-agent:mime-version
 :content-language:content-transfer-encoding;
 bh=uxRxUC/JxPZhmg4gfA3QskXtbblcp7MDDdbPReA9OpU=;
 b=iyrlQa1BQkiI9KAn7Dwgf9aK3kcrHWj+9YQNBNRlsfxmpe+Kb1PAy0hpXQH2xE0uXU
 MjZiYx2t7PV1C6c2RLM1tCvfFmAuKDWx3X6g9A2dX89E/ysEXs8PFYB5AtuqCVOpmDp0
 guBTLtnSPa6PKDigQNwALO1GxWHKJ+PynTE9UXxX5I9Ykla83/S4EcgTFC1JnxTVM6L2
 2wp7sMO5D87yZIQxlKb1hGjoVDUNESIJNTFP3a2XGjVvfuU6FCUveUbBTbNkEQAWq7o4
 DlNrVPpidvgNUEXwN+3LGlUFJvT/h6Kt9WoZq8aKDN+tK148qnC9SysIS/OJaR/SN2KX
 RPhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:subject:to:cc:message-id:date:user-agent
 :mime-version:content-language:content-transfer-encoding;
 bh=uxRxUC/JxPZhmg4gfA3QskXtbblcp7MDDdbPReA9OpU=;
 b=niCMQ9TwlEdyTx5TZlsRtyFTBmgaiA4LayMG1cXK9I8P5T1AyJ5d2jUvRQ2lUouniN
 cTGxcueB6oIEwrAW8FEo9el73Nj18ikdoZrS+KQXpATqEFJFiV2RU8ZQC/QkVoiSgtL4
 kNFsv3olp/8IffFLsiG7agDzaxWutrG06iA/6u8ZCvfkcGOIzmTWaosA5e5PQphRxQOO
 wGe1kDVHv6nnxo8OI52RE9bKXDV9DlYwmMWi7z04yeV0D9PpfD6kZtEbBUriVYi7wdio
 L/8XxgGIgtVzwBbX0VQ+FvFjxk47ZjzHIYUYuqvZiUGQ/PhVH1eFCLqAh+jSam13o6VW
 WdAg==
X-Gm-Message-State: AOAM531Yr5j0Eiif0d5+5Usuc/T6YrCcB23oTscyRj5qNEBZfDlXKnKw
 WjYI5VJDdzdm5B8ZgaGZpzj4i9j7Nb/6Xg==
X-Google-Smtp-Source: ABdhPJy9ip7xVaGxlkcmeRL+8Ei4JZ18qcPwXRrmi6/YnTTCPW48YIb2Z64YBVSaB5RGbuFbxgCKhA==
X-Received: by 2002:a7b:c4c3:: with SMTP id g3mr3922154wmk.127.1603293102995; 
 Wed, 21 Oct 2020 08:11:42 -0700 (PDT)
Received: from [192.168.0.12]
 (cpc87281-slou4-2-0-cust47.17-4.cable.virginm.net. [92.236.12.48])
 by smtp.gmail.com with ESMTPSA id u5sm4888328wru.63.2020.10.21.08.11.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 21 Oct 2020 08:11:42 -0700 (PDT)
From: Jonny Grant <jg@jguk.org>
To: nouveau@lists.freedesktop.org
Message-ID: <99565878-d8a1-0c31-d97b-93293aeef3ac@jguk.org>
Date: Wed, 21 Oct 2020 16:11:42 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
Content-Language: en-GB
X-Mailman-Approved-At: Wed, 21 Oct 2020 15:56:39 +0000
Subject: [Nouveau] nouveau crash on shutdown 5.4.0-42-generic Ubuntu 20.04
 vmmgf100.c:221
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
Cc: bskeggs@redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

nouveau crash vmmgf100.c:221
gf100_vmm_invalidate


I see this from time to time
_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
