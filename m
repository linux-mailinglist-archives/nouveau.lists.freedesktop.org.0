Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E8860CBABEC
	for <lists+nouveau@lfdr.de>; Sat, 13 Dec 2025 13:43:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3826E10EA0C;
	Sat, 13 Dec 2025 12:41:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="LyvdAvB6";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A823D10E2CB
 for <nouveau@lists.freedesktop.org>; Thu, 11 Jul 2024 18:50:56 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46BDBB79008745;
 Thu, 11 Jul 2024 18:50:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 kU90E4EzVBWO/hKTiAhZwsQuZeXFe5mA7pm/NB52++4=; b=LyvdAvB69X0Qxu62
 junCU9WNF95j6PGc4lnNgi8FX3jSKak3iir60Aml2bwB3t9SJ8NDBYMhuvs4xCee
 UrB9NRj3uaoal6opPY2Wx/KSVJLGoI3EQt1lxgEDq0gbtNHh0gEByHz6m+TM0aGd
 b8E9/DVo4PkeB1T5SeOEXYJkvIoKEvIFtPjYRecEwJMtr/qBUkoZ0jcfnCnhWimt
 lBt3LpeHkPpepkak+TNYG8j3wWHXyBYXHzoGmT0EY42+6TGYila/cEwNYKaDozNA
 F5LgrxXOoaalWuNe/cshohy41tihpOrH3PFzfQ5wlgUWmxUOwIQ38K6ZwTz1MCTC
 7+YCQQ==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 406x51dg84-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 11 Jul 2024 18:50:26 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA01.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id
 46BIoL0E024082
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 11 Jul 2024 18:50:21 GMT
Received: from [10.81.24.74] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 11 Jul
 2024 11:50:20 -0700
Message-ID: <b1f79d00-80bc-4beb-8d49-6e626b79b97c@quicinc.com>
Date: Thu, 11 Jul 2024 11:50:12 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/mm: add testmmiotrace MODULE_DESCRIPTION()
To: Steven Rostedt <rostedt@goodmis.org>, Masami Hiramatsu
 <mhiramat@kernel.org>, Karol Herbst <karolherbst@gmail.com>, Pekka Paalanen
 <ppaalanen@gmail.com>, Dave Hansen <dave.hansen@linux.intel.com>, Andy
 Lutomirski <luto@kernel.org>, Peter Zijlstra <peterz@infradead.org>, Thomas
 Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav
 Petkov <bp@alien8.de>, <x86@kernel.org>, "H. Peter Anvin" <hpa@zytor.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>
CC: <linux-kernel@vger.kernel.org>, <nouveau@lists.freedesktop.org>,
 <linux-stm32@st-md-mailman.stormreply.com>,
 <linux-arm-kernel@lists.infradead.org>
References: <20240515-testmmiotrace-md-v1-1-10919a8b2842@quicinc.com>
Content-Language: en-US
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20240515-testmmiotrace-md-v1-1-10919a8b2842@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01a.na.qualcomm.com (10.47.209.196) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: TVytbWzRQGN5Kw_RiD9K3gyN9tJ4nIXH
X-Proofpoint-ORIG-GUID: TVytbWzRQGN5Kw_RiD9K3gyN9tJ4nIXH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-11_14,2024-07-11_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 adultscore=0
 suspectscore=0 impostorscore=0 mlxlogscore=999 mlxscore=0 bulkscore=0
 priorityscore=1501 malwarescore=0 lowpriorityscore=0 phishscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2406140001 definitions=main-2407110130
X-Mailman-Approved-At: Sat, 13 Dec 2025 12:40:45 +0000
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

On 5/15/24 17:06, Jeff Johnson wrote:
> Fix the following 'make W=1' warning:
> 
> WARNING: modpost: missing MODULE_DESCRIPTION() in arch/x86/mm/testmmiotrace.o
> 
> Signed-off-by: Jeff Johnson <quic_jjohnson@quicinc.com>
> ---
>   arch/x86/mm/testmmiotrace.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/arch/x86/mm/testmmiotrace.c b/arch/x86/mm/testmmiotrace.c
> index bda73cb7a044..ae295659ca14 100644
> --- a/arch/x86/mm/testmmiotrace.c
> +++ b/arch/x86/mm/testmmiotrace.c
> @@ -144,3 +144,4 @@ static void __exit cleanup(void)
>   module_init(init);
>   module_exit(cleanup);
>   MODULE_LICENSE("GPL");
> +MODULE_DESCRIPTION("Test module for mmiotrace");
> 
> ---
> base-commit: 8c06da67d0bd3139a97f301b4aa9c482b9d4f29e
> change-id: 20240515-testmmiotrace-md-c6050c66a517

I don't see this in linux-next yet so following up to see if anything 
else is needed to get this merged.

I'm hoping to have these warnings fixed tree-wide in 6.11.

/jeff

